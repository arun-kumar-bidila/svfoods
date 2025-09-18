import 'package:flutter/material.dart';
import 'package:svfoods/utils/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String buttonName;
  final VoidCallback onTap;
  const CustomButton({super.key, required this.buttonName,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero, // remove default padding
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      onPressed: onTap,
      child: Ink(
        decoration: BoxDecoration(
          gradient: AppColors.loginButtonGradient,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Container(
          alignment: Alignment.center,
          height: 50,
          child: Text(
            buttonName,
            style: TextStyle(
              color: AppColors.backgroundDark,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
