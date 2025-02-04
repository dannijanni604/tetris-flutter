import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'game_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: GameView(),
        theme: ThemeData(scaffoldBackgroundColor: Colors.black));
  }
}
