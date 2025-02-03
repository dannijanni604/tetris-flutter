import 'package:flutter/material.dart';

class GameSquares extends StatelessWidget {
  GameSquares({super.key, required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(1),
      decoration: BoxDecoration(color: color),
    );
  }
}
