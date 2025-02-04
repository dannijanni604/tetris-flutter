import 'package:get/get.dart';

class ConfigController extends GetxController {
  RxInt gameRowsLength = 10.obs;
  RxInt gameColumnLength = 15.obs;
}

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
