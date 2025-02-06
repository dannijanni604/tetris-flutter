import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tetris_flutter/game_square.dart';
import 'package:tetris_flutter/utils/config.dart';
import 'package:tetris_flutter/utils/game_theme.dart';
import 'controller/game_controller.dart';

class GameView extends StatelessWidget {
  GameView({super.key});

  final GameController controller = Get.put(GameController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Obx(() => Expanded(
                flex: 8,
                child: GridView.builder(
                  itemCount: gameRowsLength.value * gameColumnLength.value,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: gameRowsLength.value),
                  itemBuilder: (context, index) {
                    int row = (index / gameRowsLength.value).floor();
                    int column = index % gameRowsLength.value;
                    return Center(
                      child: Obx(() {
                        if (controller.currentPiece.value.positions
                            .contains(index)) {
                          return GameSquares(
                            color: controller.currentPiece.value.color,
                            text: index.toString(),
                          );
                        } else if (gameBoard[row][column] != null) {
                          final Tetromino tetromino = gameBoard[row][column]!;
                          return GameSquares(
                            color: tetrominoColors[tetromino] ?? Colors.white,
                            text: '',
                          );
                        } else {
                          return GameSquares(
                            color: GameColors.kSquareColor,
                            text: index.toString(),
                          );
                        }
                      }),
                    );
                  },
                ),
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  onPressed: controller.movePieceLeft,
                  icon: const Icon(Icons.arrow_back_ios_new_rounded)),
              IconButton(
                  onPressed: controller.rotatePiece,
                  icon: const Icon(Icons.rotate_90_degrees_cw_rounded)),
              IconButton(
                  onPressed: controller.movePieceRight,
                  icon: const Icon(Icons.arrow_forward_ios_rounded))
            ],
          ),
          const Expanded(child: SizedBox())
        ],
      ),
    );
  }
}
