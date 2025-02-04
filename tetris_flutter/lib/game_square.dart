import 'package:flutter/material.dart';

class GameSquares extends StatelessWidget {
  GameSquares({super.key, required this.color, required this.text});

  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(1),
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(4)),
      child: Center(
        child: Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
