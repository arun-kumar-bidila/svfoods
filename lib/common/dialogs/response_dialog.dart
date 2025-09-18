import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:svfoods/utils/app_colors.dart';

/*
The dialog message 
The svg picture , try again or continue button will be passed from the response handler
*/

class ResponseDialog {
  static void showSuccessResponseDialog(
      {required BuildContext context, required String successMessage}) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            backgroundColor: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Container(
              padding: const EdgeInsets.all(25),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/succes_icon.svg",
                    width: 90,
                    height: 90,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Success",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    successMessage,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          backgroundColor: AppColors.textGreen),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "Continue",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, color: Colors.white),
                        ),
                      ))
                ],
              ),
            ),
          );
        });
  }

  static void showErrorResponseDialog(
      {required BuildContext context, required String errorMessage}) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            backgroundColor: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Container(
              padding: const EdgeInsets.all(25),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/error_icon.svg",
                    width: 90,
                    height: 90,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Error",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    errorMessage,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          backgroundColor: AppColors.textGreen),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "Try again",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, color: Colors.white),
                        ),
                      ))
                ],
              ),
            ),
          );
        });
  }
}
