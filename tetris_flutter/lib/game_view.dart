import 'package:flutter/material.dart';
import 'package:tetris_flutter/game_squares.dart';
import 'package:tetris_flutter/utils/config.dart';

class GameView extends StatelessWidget {
  const GameView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        itemCount: gameRowsLength * gameColumnLength,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: gameRowsLength),
        itemBuilder: (context, index) {
          return Center(child: GameSquares(color: Colors.yellow));
        },
      ),
    );
  }
}
