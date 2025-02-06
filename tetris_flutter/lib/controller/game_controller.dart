import 'dart:async';
import 'dart:math';
import 'package:get/get.dart';
import '../game_piece.dart';
import '../utils/config.dart';

class GameController extends GetxController {
  var currentPiece = GamePiece(type: Tetromino.L).obs;

  @override
  void onInit() {
    startGame();
    super.onInit();
  }

  startGame() {
    currentPiece.value.initializePiece();
    gameLoop(gameSpeed);
  }

  gameLoop(Duration frameRate) {
    Timer.periodic(frameRate, (timer) {
      checkLanding();
      currentPiece.value.movePiece(Direction.down);
    });
  }

  bool checkCollision(Direction direction) {
    for (var i = 0; i < currentPiece.value.positions.length; i++) {
      int row =
          (currentPiece.value.positions[i] / gameRowsLength.value).floor();
      int column = currentPiece.value.positions[i] % gameRowsLength.value;

      if (direction == Direction.left) {
        column -= 1;
      } else if (direction == Direction.right) {
        column += 1;
      } else if (direction == Direction.down) {
        row += 1;
      }

      if (row >= gameColumnLength.value ||
          column < 0 ||
          column >= gameRowsLength.value) {
        return true;
      }

      if (row >= 0 && column >= 0) {
        if (gameBoard[row][column] != null) {
          return true;
        }
      }
    }
    return false;
  }

  checkLanding() {
    if (checkCollision(Direction.down)) {
      for (int i = 0; i < currentPiece.value.positions.length; i++) {
        int row =
            (currentPiece.value.positions[i] / gameRowsLength.value).floor();
        int column = currentPiece.value.positions[i] % gameRowsLength.value;

        if (row >= 0 && column >= 0) {
          gameBoard[row][column] = currentPiece.value.type;
        }

        if (row < 0) {
          // Get.snackbar('Game Over', 'You lost');
          break;
        }
      }

      createPiece();
    }
  }

  void createPiece() {
    Random random = Random();

    Tetromino nextPiece =
        Tetromino.values[random.nextInt(Tetromino.values.length)];

    currentPiece.value = GamePiece(type: nextPiece);

    currentPiece.value.initializePiece();
  }

  movePieceLeft() {
    if (checkCollision(Direction.left)) {
      return;
    } else {
      currentPiece.value.movePiece(Direction.left);
    }
  }

  movePieceRight() {
    if (checkCollision(Direction.right)) {
      return;
    } else {
      currentPiece.value.movePiece(Direction.right);
    }
  }

  rotatePiece() {
    currentPiece.value.rotatePiece();
  }
}
