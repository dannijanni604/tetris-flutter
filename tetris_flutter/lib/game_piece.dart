import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tetris_flutter/utils/config.dart';
import 'package:tetris_flutter/utils/game_theme.dart';

class GamePiece {
  Tetromino type;

  GamePiece({required this.type});

  var positions = <int>[].obs;
  int rotateState = 1;

  Color get color {
    return tetrominoColors[type] ?? Colors.white;
  }

  void initializePiece() {
    switch (type) {
      case Tetromino.L:
        positions = [-26, -16, -6, -5].obs;
        break;
      case Tetromino.J:
        positions = [-25, -15, -5, -6].obs;
        break;
      case Tetromino.I:
        positions = [-4, -5, -6, -7].obs;
        break;
      case Tetromino.O:
        positions = [-15, -16, -5, -6].obs;
        break;
      case Tetromino.S:
        positions = [-15, -14, -5, -6].obs;
        break;
      case Tetromino.Z:
        positions = [-17, -16, -6, -5].obs;
        break;
      case Tetromino.T:
        positions = [-26, -16, -6, -15].obs;
        break;

      default:
    }
  }

  void movePiece(Direction direction) {
    switch (direction) {
      case Direction.down:
        for (int i = 0; i < positions.length; i++) {
          positions[i] += gameRowsLength.value;
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

  // void rotatePiece() {
  //   List<int> newPosition = [];
  //   switch (type) {
  //     case Tetromino.L:
  //       switch (rotateState) {
  //         case 0:
  //           newPosition = [
  //             positions[1] - gameRowsLength.value,
  //             positions[1],
  //             positions[1] + gameRowsLength.value,
  //             positions[1] + gameRowsLength.value + 1,
  //           ].obs;

  //           if (positionIsValid(newPosition)) {
  //             positions.value = newPosition;
  //             rotateState = (rotateState + 1) % 4;
  //           }
  //           break;

  //         case 1:
  //           newPosition = [
  //             positions[1] - 1,
  //             positions[1],
  //             positions[1] + 1,
  //             positions[1] + gameRowsLength.value - 1,
  //           ].obs;

  //           if (positionIsValid(newPosition)) {
  //             positions.value = newPosition;
  //             rotateState = (rotateState + 1) % 4;
  //           }
  //           break;

  //         case 2:
  //           newPosition = [
  //             positions[1] + gameRowsLength.value,
  //             positions[1],
  //             positions[1] - gameRowsLength.value,
  //             positions[1] - gameRowsLength.value - 1,
  //           ].obs;

  //           if (positionIsValid(newPosition)) {
  //             positions.value = newPosition;
  //             rotateState = (rotateState + 1) % 4;
  //           }
  //           break;

  //         case 3:
  //           newPosition = [
  //             positions[1] - gameRowsLength.value + 1,
  //             positions[1],
  //             positions[1] + 1,
  //             positions[1] - 1,
  //           ].obs;

  //           if (positionIsValid(newPosition)) {
  //             positions.value = newPosition;
  //             rotateState = (rotateState + 1) % 4;
  //           }
  //           break;
  //       }
  //       break;
  //     default:
  //   }
  // }

  void rotatePiece() {
    List<int> newPosition = [];

    switch (type) {
      case Tetromino.L:
        switch (rotateState) {
          case 0:
            newPosition = [
              positions[1] - gameRowsLength.value,
              positions[1],
              positions[1] + gameRowsLength.value,
              positions[1] + gameRowsLength.value + 1,
            ];
            break;
          case 1:
            newPosition = [
              positions[1] - 1,
              positions[1],
              positions[1] + 1,
              positions[1] + gameRowsLength.value - 1,
            ];
            break;
          case 2:
            newPosition = [
              positions[1] + gameRowsLength.value,
              positions[1],
              positions[1] - gameRowsLength.value,
              positions[1] - gameRowsLength.value - 1,
            ];
            break;
          case 3:
            newPosition = [
              positions[1] - gameRowsLength.value + 1,
              positions[1],
              positions[1] + 1,
              positions[1] - 1,
            ];
            break;
        }
        break;

      case Tetromino.J:
        switch (rotateState) {
          case 0:
            newPosition = [
              positions[1] - gameRowsLength.value,
              positions[1],
              positions[1] + gameRowsLength.value,
              positions[1] + gameRowsLength.value - 1,
            ];
            break;
          case 1:
            newPosition = [
              positions[1] - 1,
              positions[1],
              positions[1] + 1,
              positions[1] - gameRowsLength.value + 1,
            ];
            break;
          case 2:
            newPosition = [
              positions[1] + gameRowsLength.value,
              positions[1],
              positions[1] - gameRowsLength.value,
              positions[1] - gameRowsLength.value + 1,
            ];
            break;
          case 3:
            newPosition = [
              positions[1] - gameRowsLength.value - 1,
              positions[1],
              positions[1] - 1,
              positions[1] + 1,
            ];
            break;
        }
        break;

      case Tetromino.I:
        switch (rotateState) {
          case 0:
          case 2:
            newPosition = [
              positions[1] - 2,
              positions[1] - 1,
              positions[1],
              positions[1] + 1,
            ];
            break;
          case 1:
          case 3:
            newPosition = [
              positions[1] - 2 * gameRowsLength.value,
              positions[1] - gameRowsLength.value,
              positions[1],
              positions[1] + gameRowsLength.value,
            ];
            break;
        }
        break;

      case Tetromino.O:
        // 🚨 O-block does not rotate
        return;

      case Tetromino.S:
        switch (rotateState) {
          case 0:
          case 2:
            newPosition = [
              positions[1] - gameRowsLength.value + 1,
              positions[1],
              positions[1] + gameRowsLength.value,
              positions[1] + gameRowsLength.value - 1,
            ];
            break;
          case 1:
          case 3:
            newPosition = [
              positions[1] - 1,
              positions[1],
              positions[1] + gameRowsLength.value,
              positions[1] + gameRowsLength.value + 1,
            ];
            break;
        }
        break;

      case Tetromino.Z:
        switch (rotateState) {
          case 0:
          case 2:
            newPosition = [
              positions[1] - gameRowsLength.value - 1,
              positions[1] - gameRowsLength.value,
              positions[1],
              positions[1] + gameRowsLength.value,
            ];
            break;
          case 1:
          case 3:
            newPosition = [
              positions[1] - gameRowsLength.value + 1,
              positions[1],
              positions[1] + 1,
              positions[1] + gameRowsLength.value - 1,
            ];
            break;
        }
        break;

      case Tetromino.T:
        switch (rotateState) {
          case 0:
            newPosition = [
              positions[1] - gameRowsLength.value,
              positions[1] - 1,
              positions[1],
              positions[1] + 1,
            ];
            break;
          case 1:
            newPosition = [
              positions[1] - gameRowsLength.value,
              positions[1],
              positions[1] + 1,
              positions[1] + gameRowsLength.value,
            ];
            break;
          case 2:
            newPosition = [
              positions[1] - 1,
              positions[1],
              positions[1] + 1,
              positions[1] + gameRowsLength.value,
            ];
            break;
          case 3:
            newPosition = [
              positions[1] - gameRowsLength.value,
              positions[1] - 1,
              positions[1],
              positions[1] + gameRowsLength.value,
            ];
            break;
        }
        break;
    }

    // 🚨 Validate position before applying rotation
    if (positionIsValid(newPosition)) {
      positions.value = newPosition;
      rotateState = (rotateState + 1) % 4;
    }
  }

  bool checkValidPosition(int pos) {
    int row = (pos / gameRowsLength.value).floor();
    int column = pos % gameRowsLength.value;
    if (row < 0 || column < 0 || gameBoard[row][column] != null) {
      return false;
    } else {
      return true;
    }
  }

  bool positionIsValid(List<int> piecesPos) {
    bool firstColumnOccupied = false;
    bool lastColumnOccupied = false;

    for (var pos in piecesPos) {
      if (!checkValidPosition(pos)) {
        return false;
      }

      int column = pos % gameRowsLength.value;
      if (column == 0) {
        firstColumnOccupied = true;
      } else if (column == gameRowsLength.value - 1) {
        lastColumnOccupied = true;
      }
    }
    return !(firstColumnOccupied && lastColumnOccupied);
  }
}
