import 'package:flutter/material.dart';
import 'package:svfoods/common/widgets/custom_button.dart';
import 'package:svfoods/common/widgets/custom_textform_field.dart';
import 'package:svfoods/features/auth/screens/reset_password.dart';

import 'package:svfoods/utils/app_colors.dart';

class ForgotPassword extends StatefulWidget {
  static const String routeName = "/forgot-password";
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.backgroundDark,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20, right: 25, left: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //app logo

              Container(
                alignment: Alignment.center,
                child: Image.asset(
                  "assets/logo.png",
                  height: 200,
                ),
              ),

              Text(
                "Forgot Password",
                style: TextStyle(
                    color: AppColors.textGreen,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),

              SizedBox(
                height: 30,
              ),

              Text(
                "Email",
                style: TextStyle(
                    color: AppColors.textGreen,
                    fontSize: 15,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextformField(
                inputText: "Enter your email",
                inputIcon: Icons.security,
                isPassword: true,
              ),

              SizedBox(
                height: 40,
              ),
              CustomButton(
                buttonName: "Send Code",
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, ResetPassword.routeName, (route) => false);
                },
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      )),
    );
    
  }
}
