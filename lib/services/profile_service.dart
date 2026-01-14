import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:svfoods/common/dialogs/response_dialog.dart';
import 'package:svfoods/features/auth/screens/login.dart';

class ProfileService {
  Future<void> logOutUser({required BuildContext context}) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString("token", "");
      
      ResponseDialog.showSuccessResponseDialog(
          context: context,
          successMessage: "LogOut Successful",
          onSuccess: () {});
      Navigator.pushNamedAndRemoveUntil(
          context, Login.routeName, (route) => false);
    } catch (e) {
      ResponseDialog.showErrorResponseDialog(
          context: context, errorMessage: "LogOut Failure");
    }
  }
}
