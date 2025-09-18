import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:svfoods/common/widgets/custom_button.dart';
import 'package:svfoods/common/widgets/custom_textform_field.dart';
import 'package:svfoods/features/auth/screens/create_account.dart';
import 'package:svfoods/features/auth/screens/forgot_password.dart';
import 'package:svfoods/utils/app_colors.dart';

class Login extends StatefulWidget {
  static const String routeName = "/login";
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
                "LogIn ",
                style: TextStyle(
                    color: AppColors.textGreen,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              // SizedBox(
              //   height: 10,
              // ),
              // Text(
              //   "Create your account to use our services",
              //   style: TextStyle(
              //       color: AppColors.textGreen,
              //       fontSize: 15,
              //       fontWeight: FontWeight.w400),
              // ),
              SizedBox(
                height: 30,
              ),

              // Text(
              //   "Mobile Number",
              //   style: TextStyle(
              //       color: AppColors.textGreen,
              //       fontSize: 13,
              //       fontWeight: FontWeight.w600),
              // ),
              // SizedBox(
              //   height: 10,
              // ),
              // CustomTextformField(
              //   inputText: "Enter your mobile number",
              //   inputIcon: Icons.phone,
              // ),
              // SizedBox(
              //   height: 10,
              // ),
              Text(
                "Email",
                style: TextStyle(
                    color: AppColors.textGreen,
                    fontSize: 13,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextformField(
                inputText: "Enter your email",
                inputIcon: Icons.email_outlined,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Password",
                style: TextStyle(
                    color: AppColors.textGreen,
                    fontSize: 13,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextformField(
                inputText: "Enter your password",
                inputIcon: Icons.security,
                isPassword: true,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, ForgotPassword.routeName, (route) => false);
                  },
                  child: Text(
                    "Forgot Password ?",
                    style: TextStyle(
                        color: AppColors.textWhite,
                        fontSize: 15,
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.textWhite),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              CustomButton(
                buttonName: "Login",
                onTap: () {},
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                alignment: Alignment.center,
                child: RichText(
                  text: TextSpan(
                    text: "Don't have an account ?  ",
                    style: TextStyle(
                      color: AppColors.textWhite,
                      fontSize: 15,
                    ),
                    children: [
                      TextSpan(
                          text: "Create",
                          style: TextStyle(
                              color: AppColors.textGreen,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              decoration: TextDecoration.underline),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushNamedAndRemoveUntil(context,
                                  CreateAccount.routeName, (route) => false);
                            }),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
