import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tetris_flutter/game_view.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () => Get.to(() => GameView()),
            child: const Text('Start Game')),
      ),
    );
  }
}
