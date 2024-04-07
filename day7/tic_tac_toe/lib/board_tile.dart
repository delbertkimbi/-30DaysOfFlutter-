import 'package:flutter/material.dart';
import 'package:tic_tac_toe/tile_state.dart';

class BoardTile extends StatelessWidget {
  final double tileDimension;
  final VoidCallback onPressed;
  final TileState tileState;

  const BoardTile(
      {super.key,
      required this.tileDimension,
      required this.onPressed,
      required this.tileState});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: tileDimension,
      height: tileDimension,
      child: MaterialButton(
        onPressed: onPressed,
        child: _widgetForTileState(),
      ),
    );
  }

  Widget _widgetForTileState() {
    Widget widget;
    switch (tileState) {
      case TileState.EMPTY:
        widget = Container();
        break;
      case TileState.CROSS:
        widget = Image.asset('images/x.png');
        break;
      case TileState.CIRCLE:
        widget = Image.asset('images/o.png');
        break;
    }
    return widget;
  }
}
