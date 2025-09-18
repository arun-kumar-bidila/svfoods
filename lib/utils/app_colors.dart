import 'package:flutter/material.dart';

class AppColors {
  // 🔵 Background
  static const Color backgroundDark = Color(0xFF0A0F0A);

  // 🔵 Text Colors

  static const Color textGreen = Colors.green;
  static const Color textWhite = Colors.white;
  static const Color textPlaceholder = Color(0xFF7C7C7C);
  static const Color textInput = Color(0xFFFFFFFF);


  // 🔵 Borders & Icons
  static const Color iconColor = Colors.green;
  static const Color borderColor = Colors.green;
  static const Color inputBorder = Color(0xFF1F2A1F);
  static const Color iconGray = Color(0xFF7C7C7C);

  // 🔵 Buttons
  static const Color buttonBorder = Color(0xFF3A3A3A);


  // 🔵 Gradients
  static const Gradient loginButtonGradient = LinearGradient(
    colors: [Color(0xFFA6FF00), Color(0xFF00FF94)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static const Gradient backgroundGradient = LinearGradient(
    colors: [
      Color(0xFF00FF94), // neon green
      Color(0xFF0A0F0A), // dark green-black
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
