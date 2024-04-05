import 'package:flutter/material.dart';

class FlashCarddView extends StatelessWidget {
  final String text;
  const FlashCarddView({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Text(
          text,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
