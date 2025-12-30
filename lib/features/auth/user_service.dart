import 'dart:convert';

import 'package:svfoods/models/user.dart';
import 'package:http/http.dart' as http;

class UserService {
  final String uri = "http://10.125.11.59:4000/api/user";
  Future<bool> createUser(
      {required String name,
      required String email,
      required String password}) async {
    try {
      print("\n");
      print("function invoked");
      print(email);
      final response = await http.post(Uri.parse("$uri/register"),
          headers: {"Content-Type": "application/json"},
          body:
              jsonEncode({"name": name, "email": email, "password": password}));

      print("\n");
      print("function called");

      final Map<String, dynamic> data = jsonDecode(response.body);

      print(data);

      if (data["success"] == true) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }
}
