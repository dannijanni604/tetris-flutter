import 'package:get/get.dart';
import 'package:tetris_flutter/utils/config.dart';

class GamePiece {
  Tetromino type;

  GamePiece({required this.type});

  List<int> positions = [];

  void initializePiece() {
    switch (type) {
      case Tetromino.L:
        positions = [
          4,
          14,
          24,
          25,
        ];

        break;
      default:
    }
  }

  void movePiece(Direction direction) {
    final controller = Get.put(ConfigController());
    switch (direction) {
      case Direction.down:
        for (int i = 0; i < positions.length; i++) {
          positions[i] += controller.gameRowsLength.value;
        }
        break;
      case Direction.left:
        for (int i = 0; i < positions.length; i++) {
          positions[i] -= 1;
        }
        break;
      case Direction.right:
        for (int i = 0; i < positions.length; i++) {
          positions[i] += 1;
        }
        break;
      default:
    }
  }
}
