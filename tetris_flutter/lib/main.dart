import 'package:flutter/material.dart';
import 'game_view.dart';
import 'utils/game_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(context) {
    return MaterialApp(
      home: const GameView(),
      theme: tetrisTheme(),
    );
  }
}
