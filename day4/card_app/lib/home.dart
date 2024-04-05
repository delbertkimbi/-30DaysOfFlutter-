import 'package:card_app/flashcard.dart';
import 'package:card_app/flashcard_view.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

class CardPage extends StatefulWidget {
  const CardPage({super.key});

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  final List<FlashCard> _cards = [
    FlashCard(
      question: "What programming language does flutter use?",
      answer: 'Dart',
    ),
    FlashCard(
      question: "Who will be the wealthiest man on earth by 2035?",
      answer: 'Delbert Kimbi',
    ),
    FlashCard(
      question: "Who is currently teaching me programming now?",
      answer: 'Kilo Loco',
    ),
  ];
  int _currentIndext = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 250,
              width: 250,
              child: FlipCard(
                front: FlashCarddView(
                  text: _cards[_currentIndext].question,
                ),
                back: FlashCarddView(text: _cards[_currentIndext].answer),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                OutlinedButton.icon(
                  onPressed: showPreviousCard,
                  icon: const Icon(Icons.arrow_back_ios),
                  label: const Text("Previous"),
                ),
                OutlinedButton.icon(
                  onPressed: showNextCard,
                  icon: const Icon(Icons.arrow_forward_ios_outlined),
                  label: const Text("Next"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  showNextCard() {
    setState(() {
      _currentIndext =
          _cards.length > _currentIndext + 1 ? _currentIndext + 1 : 0;
    });
  }

  showPreviousCard() {
    setState(() {
      _currentIndext =
          _currentIndext - 1 < 0 ? _cards.length - 1 : _currentIndext - 1;
    });
  }
}
