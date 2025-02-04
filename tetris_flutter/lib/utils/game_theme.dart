import 'package:flutter/material.dart';

// ThemeData tetrisTheme() {
//   return ThemeData(
//     brightness: Brightness.dark,
//     primaryColor: const Color(0xFF2C3E50), // Dark Slate Blue for the background
//     // scaffoldBackgroundColor: const Color(0xFF2C3E50), // Same for scaffold
//     scaffoldBackgroundColor: Colors.black,
//     canvasColor: const Color(0xFF2C3E50),
//     // Background color for UI elements

//     // Tetromino colors
//     hintColor: const Color(0xFF1ABC9C), // Bright Cyan
//     buttonTheme: const ButtonThemeData(
//       buttonColor: Color(0xFFFF5733), // Sunset Orange for buttons
//       textTheme: ButtonTextTheme.primary,
//     ),

//     // Text Style for Score/Level (Neon Green)
//     textTheme: const TextTheme(
//       displayLarge: TextStyle(
//         fontSize: 32,
//         fontWeight: FontWeight.bold,
//         color: Color(0xFF00FF00), // Neon Green for score
//       ),
//       bodyLarge: TextStyle(
//         fontSize: 20,
//         color: Color(0xFFBDC3C7), // Light Gray for body text
//       ),
//       labelLarge: TextStyle(
//         fontSize: 18,
//         fontWeight: FontWeight.w600,
//         color: Colors.white,
//       ),
//     ),

//     // AppBar and other UI elements
//     appBarTheme: const AppBarTheme(
//       backgroundColor: Color(0xFF2C3E50), // Dark background for AppBar
//       elevation: 0,
//       titleTextStyle: TextStyle(
//         color: Colors.white,
//         fontWeight: FontWeight.bold,
//       ),
//     ),

//     // Button Text Color (White for text on buttons)
//     floatingActionButtonTheme: const FloatingActionButtonThemeData(
//       backgroundColor: Color(0xFFFF5733), // Sunset Orange for FAB
//       foregroundColor: Colors.white,
//     ),

//     // Color for different Tetrominoes
//     primaryColorLight: const Color(0xFF1ABC9C), // I Tetromino (Cyan)
//     secondaryHeaderColor: const Color(0xFF9B59B6), // T Tetromino (Purple)
//     cardColor: const Color(0xFFFF5733), // L Tetromino (Orange)
//     indicatorColor: const Color(0xFFF1C40F), // O Tetromino (Yellow)
//     // canvasColor: const Color(0xFF2980B9), // J Tetromino (Blue)
//     // bottomAppBarColor: const Color(0xFF2ECC71), // S Tetromino (Green)
//     highlightColor: const Color(0xFFE74C3C), // Z Tetromino (Red)
//   );
// }

class GameColors {
  static Color kSquareColor = Colors.grey.shade900;
  static Color kDeepOrange = Colors.deepOrangeAccent;
  static Color kDeepYellow = Colors.yellowAccent.shade700;
}
