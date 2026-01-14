import 'package:flutter/material.dart';
import 'package:svfoods/utils/app_colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: Image.asset(
            "assets/logo_2.png",
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
