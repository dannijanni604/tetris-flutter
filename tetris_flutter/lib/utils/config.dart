import 'package:get/get.dart';

enum Tetromino {
  L,
  J,
  I,
  O,
  S,
  Z,
  T,
}

enum Direction {
  left,
  right,
  down,
}

Duration gameSpeed = const Duration(milliseconds: 500);
RxInt gameRowsLength = 10.obs;
RxInt gameColumnLength = 15.obs;

//Game Board

List<List<Tetromino?>> gameBoard = List.generate(gameColumnLength.value,
    (j) => List.generate(gameRowsLength.value, (k) => null));
