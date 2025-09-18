import 'package:flutter/material.dart';

class AppColors {
  // 🔵 Background
  static const Color backgroundDark = Color(0xFF0A0F0A);

  // 🔵 Text Colors

  static const Color textGreen = Colors.green;
  static const Color textWhite = Colors.white;
  static const Color textGray = Color(0xFFA0A0A0);
  static const Color textPlaceholder = Color(0xFF7C7C7C);
  static const Color textInput = Color(0xFFFFFFFF);
  static const Color textLinkGreen = Color(0xFF00FF94);

  // 🔵 Borders & Icons
  static const Color iconColor = Colors.green;
  static const Color borderColor = Colors.green;
  static const Color inputBorder = Color(0xFF1F2A1F);
  static const Color iconGray = Color(0xFF7C7C7C);

  // 🔵 Buttons
  static const Color buttonBorder = Color(0xFF3A3A3A);
  static const Color googleRed = Color(0xFFDB4437);
  static const Color googleBlue = Color(0xFF4285F4);
  static const Color googleYellow = Color(0xFFF4B400);
  static const Color googleGreen = Color(0xFF0F9D58);
  static const Color appleWhite = Color(0xFFFFFFFF);

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
