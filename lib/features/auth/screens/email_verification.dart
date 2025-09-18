import 'package:flutter/material.dart';
import 'package:svfoods/common/dialogs/response_dialog.dart';
import 'package:svfoods/common/widgets/custom_button.dart';
import 'package:svfoods/common/widgets/custom_textform_field.dart';
import 'package:svfoods/features/auth/screens/create_account.dart';
import 'package:svfoods/utils/app_colors.dart';

class EmailVerification extends StatefulWidget {
  static const String routeName = "/email-verification";
  const EmailVerification({super.key});

  @override
  State<EmailVerification> createState() => _EmailVerificationState();
}

class _EmailVerificationState extends State<EmailVerification> {
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
                "Email Verification",
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
              Container(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, CreateAccount.routeName, (route) => false);
                  },
                  child: Text(
                    "Change Email ?",
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
                buttonName: "Verify Email",
                onTap: () {
                  ResponseDialog.showSuccessResponseDialog(
                      context: context,
                      successMessage: "Verification Successful");
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
