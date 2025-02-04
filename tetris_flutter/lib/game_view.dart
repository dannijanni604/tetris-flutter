import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tetris_flutter/game_piece.dart';
import 'package:tetris_flutter/game_square.dart';
import 'package:tetris_flutter/utils/config.dart';
import 'package:tetris_flutter/utils/game_theme.dart';

// GetX Controller for Game Logic
class GameController extends GetxController {
  var currentPiece = GamePiece(type: Tetromino.L).obs;

  @override
  void onInit() {
    startGame();
    super.onInit();
  }

  startGame() {
    currentPiece.value.initializePiece();
    Duration frameRate = const Duration(milliseconds: 400);
    gameLoop(frameRate);
  }

  gameLoop(Duration frameRate) {
    Timer.periodic(
      frameRate,
      (timer) {
        currentPiece.value.movePiece(Direction.down);
      },
    );
  }
}

class GameView extends StatelessWidget {
  GameView({super.key});

  final GameController controller = Get.put(GameController());

  @override
  Widget build(BuildContext context) {
    final configController = Get.put(ConfigController());

    return Scaffold(
      body: Obx(() => GridView.builder(
            itemCount: configController.gameRowsLength.value *
                configController.gameColumnLength.value,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: configController.gameRowsLength.value),
            itemBuilder: (context, index) {
              return Center(
                child: controller.currentPiece.value.positions.contains(index)
                    ? GameSquares(
                        color: GameColors.kDeepOrange,
                        text: index.toString(),
                      )
                    : GameSquares(
                        color: GameColors.kSquareColor,
                        text: index.toString(),
                      ),
              );
            },
          )),
    );
  }
}
