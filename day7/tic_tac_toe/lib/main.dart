import 'package:flutter/material.dart';
import 'package:tic_tac_toe/board_tile.dart';
import 'package:tic_tac_toe/tile_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _boardState = List.filled(9, TileState.EMPTY);
  late var _currentTurn = TileState.CROSS;
  final navigatorKey = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              "Tic Tac Toe",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.green,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
          ),
          body: Center(
              child: Column(
            children: [
              Stack(
                children: [
                  Image.asset('images/board.png'),
                  _boardTiles(),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.green,
                  ),
                  onPressed: () {
                    _resetGame();
                  },
                  child: const Center(
                      child: Text(
                    'New Game',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  )),
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }

  Widget _boardTiles() {
    return Builder(builder: (context) {
      final boardDimension = MediaQuery.of(context).size.width;
      final tileSize = boardDimension / 3;
      return SizedBox(
        width: boardDimension,
        height: boardDimension,
        child: Column(
          children: chunk(_boardState, 3).asMap().entries.map((entry) {
            final chunkIndex = entry.key;
            final tileStateChunk = entry.value;
            return Row(
              children: tileStateChunk.asMap().entries.map((innerEntry) {
                final innerIndex = innerEntry.key;
                final tileState = innerEntry.value;
                final tileIndex = (chunkIndex * 3) + innerIndex;

                return BoardTile(
                    tileDimension: tileSize,
                    onPressed: () => _updateTileStateForIndex(tileIndex),
                    tileState: tileState);
              }).toList(),
            );
          }).toList(),
        ),
      );
    });
  }

  void _updateTileStateForIndex(int selectedIndex) {
    if (_boardState[selectedIndex] == TileState.EMPTY) {
      setState(() {
        _boardState[selectedIndex] = _currentTurn;
        _currentTurn = _currentTurn == TileState.CROSS
            ? TileState.CIRCLE
            : TileState.CROSS;
      });
      final winner = _findWinner();
      debugPrint('Winner is : $winner');
      _showWinnerDialog(winner);
    }
  }

  TileState _findWinner() {
    winnerForMatch(a, b, c) {
      if (_boardState[a] != TileState.EMPTY) {
        if (_boardState[a] == _boardState[b] &&
            _boardState[b] == _boardState[c]) {
          return _boardState[a];
        }
      }
      return null;
    }

    final checks = [
      winnerForMatch(0, 1, 2),
      winnerForMatch(3, 4, 5),
      winnerForMatch(6, 7, 8),
      winnerForMatch(0, 3, 6),
      winnerForMatch(1, 4, 7),
      winnerForMatch(2, 5, 8),
      winnerForMatch(0, 4, 8),
      winnerForMatch(2, 4, 6),
    ];
    TileState? winner;
    for (int i = 0; i < checks.length; i++) {
      if (checks[i] != null) {
        winner = checks[i];
        break;
      }
    }
    return winner!;
  }

  void _showWinnerDialog(TileState tileState) {
    showDialog(
        context: navigatorKey.currentState!.overlay!.context,
        builder: (_) {
          return AlertDialog(
            title: const Center(
              child: Text(
                "Winner",
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.w600,
                  fontSize: 25,
                ),
              ),
            ),
            content: Image.asset(
                tileState == TileState.CROSS ? 'images/x.png' : 'images/o.png'),
            actions: [
              MaterialButton(
                onPressed: () {
                  _resetGame();
                  Navigator.of(navigatorKey.currentState!.overlay!.context)
                      .pop();
                },
                child: const Center(
                    child: Text(
                  'New Game',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                )),
              ),
            ],
          );
        });
  }

  void _resetGame() {
    setState(() {
      _boardState = List.filled(9, TileState.EMPTY);
      _currentTurn = TileState.CROSS;
    });
  }
}
