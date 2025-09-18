import 'package:flutter/material.dart';
import 'package:svfoods/common/widgets/custom_button.dart';
import 'package:svfoods/common/widgets/custom_textform_field.dart';
import 'package:svfoods/utils/app_colors.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.backgroundDark,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only( bottom: 20, right: 25, left: 25),
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
                "Create Account",
                style: TextStyle(
                    color:AppColors.textGreen,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Create your account to use our services",
                style: TextStyle(
                    color:AppColors.textGreen,
                    fontSize: 15,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Name",
                style: TextStyle(
                    color: AppColors.textGreen,
                    fontSize: 13,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextformField(
                inputText: "Enter your name",
                inputIcon: Icons.person,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Mobile Number",
                style: TextStyle(
                    color: AppColors.textGreen,
                    fontSize: 13,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextformField(
                inputText: "Enter your mobile number",
                inputIcon: Icons.phone,
              ),
              SizedBox(
                height: 10,
              ),
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
                height: 40,
              ),
              CustomButton(
                buttonName: "Create Account",
              )
            ],
          ),
        ),
      )),
    );
  }
}
