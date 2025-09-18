import 'package:flutter/material.dart';
import 'package:svfoods/common/widgets/custom_button.dart';
import 'package:svfoods/common/widgets/custom_textform_field.dart';
import 'package:svfoods/utils/app_colors.dart';

class ResetPassword extends StatefulWidget {
  static const String routeName = "/reset-password";
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
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
                "Reset Password",
                style: TextStyle(
                    color: AppColors.textGreen,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),

              SizedBox(
                height: 30,
              ),
              Text(
                "Enter code sent to your email",
                style: TextStyle(
                    color: AppColors.textGreen,
                    fontSize: 15,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextformField(
                inputText: "Enter code",
                inputIcon: Icons.security,
                isPassword: true,
              ),
              SizedBox(
                height: 20,
              ),

              Text(
                "New Password",
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
                buttonName: "Reset Password",
                onTap: () {},
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
