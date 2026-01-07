import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:svfoods/common/dialogs/response_dialog.dart';
import 'package:svfoods/features/auth/screens/login.dart';
import 'package:svfoods/features/bottombar/bottombar.dart';
import 'package:svfoods/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:svfoods/provider/user_provider.dart';
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
      ResponseDialog.showErrorResponseDialog(
          context: context, errorMessage: e.toString());
    }
  }

  Future<void> loginUser(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      print("\n");
      print("function invoked");
      print(email);
      final response = await http.post(Uri.parse("$uri/api/user/login"),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({"email": email, "password": password}));

      print("\n");
      print("function called");

      final Map<String, dynamic> data = jsonDecode(response.body);

      print(data["token"]);

      if (data["success"] == true) {
        Provider.of<UserProvider>(context, listen: false)
            .setUser(response.body);
        SharedPreferences prefs = await SharedPreferences.getInstance();

        await prefs.setString("token", data["token"]);

        ResponseDialog.showSuccessResponseDialog(
            context: context,
            successMessage: "Login Successful",
            onSuccess: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, Bottombar.routeName, (route) => false);
              print("function passed");
            });
      } else {
        ResponseDialog.showErrorResponseDialog(
            context: context, errorMessage: data["message"]);
      }
    } catch (e) {
      ResponseDialog.showErrorResponseDialog(
          context: context, errorMessage: e.toString());
    }
  }

  Future<void> getUserData({required BuildContext context}) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString("token");

      if (token == null) {
        prefs.setString("token", "");
      }

      final response = await http.get(Uri.parse("$uri/api/user/getdata"),
          headers: {"Content-Type": "application/json", "token": token!});

      final Map<String, dynamic> data = jsonDecode(response.body);
      
      if (data["success"] == true) {
        userProvider.setUser(response.body);
        userProvider.setIsLoading(false);
        print("function passed");
      } else {
        userProvider.setIsLoading(false);
        ResponseDialog.showErrorResponseDialog(
            context: context, errorMessage: data["message"]);
      }
    } catch (e) {
      userProvider.setIsLoading(false);
      ResponseDialog.showErrorResponseDialog(
          context: context, errorMessage: e.toString());
    }
  }
}
