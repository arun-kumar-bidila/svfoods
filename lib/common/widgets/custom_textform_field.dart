import 'package:flutter/material.dart';
import 'package:svfoods/utils/app_colors.dart';

class CustomTextformField extends StatefulWidget {
  final String inputText;
  final IconData inputIcon;
  final bool isPassword;
  const CustomTextformField(
      {super.key,
      required this.inputText,
      required this.inputIcon,
      this.isPassword = false});

  @override
  State<CustomTextformField> createState() => _CustomTextformFieldState();
}

class _CustomTextformFieldState extends State<CustomTextformField> {
  bool isObscureText = true;
  @override
  Widget build(BuildContext context) {
    
    return TextFormField(
      cursorColor: AppColors.iconColor,
      obscureText: widget.isPassword ? isObscureText : false,
      style: const TextStyle(
        color: AppColors.textInput, // white text
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.transparent, // keeps background dark
        hintText: widget.inputText,
        hintStyle: const TextStyle(
          color: AppColors.textPlaceholder, 
        ),
        prefixIcon: Icon(
          widget.inputIcon,
          color: AppColors.iconColor,
        ),
         suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  isObscureText ? Icons.visibility_off : Icons.visibility,
                  color: AppColors.iconColor,
                ),
                onPressed: () {
                  setState(() {
                    isObscureText = !isObscureText;
                  });
                },
              )
            : null,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: AppColors.borderColor, // dark green-gray border
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: AppColors.borderColor, // neon green when focused
            width: 1.5,
          ),
        ),
      ),
    );
  }
}
