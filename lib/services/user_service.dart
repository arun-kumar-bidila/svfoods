import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:svfoods/common/dialogs/response_dialog.dart';
import 'package:svfoods/features/auth/screens/login.dart';
import 'package:svfoods/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:svfoods/utils/app_colors.dart';

class UserService {
  Future<void> createUser(
      {required String name,
      required String email,
      required String password,
      required BuildContext context}) async {
    try {
      User user = User(name: name, email: email, password: password);
      print("\n");
      print("function invoked");
      print(email);
      final response = await http.post(Uri.parse("$uri/api/user/register"),
          headers: {"Content-Type": "application/json"}, body: user.toJson());

      print("\n");
      print("function called");

      final Map<String, dynamic> data = jsonDecode(response.body);

      print(data);

      if (data["success"] == true) {
        ResponseDialog.showSuccessResponseDialog(
            context: context,
            successMessage: "Account Created",
            onSuccess: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, Login.routeName, (route) => false);
              print("function passed");
            });
      } else {
        ResponseDialog.showErrorResponseDialog(
            context: context, errorMessage: data["message"]);
      }
    } catch (e) {
      print(e);
    }
  }
}
