import 'package:flutter/material.dart';
import 'package:svfoods/models/user.dart';

class UserProvider extends ChangeNotifier {
  User _user = User(name: "", email: "", password: "");
  bool _isLoading = true;

  User get user => _user;
  bool get isLoading => _isLoading;

  void setUser(String user) {
    _user = User.fromJson(user);
    notifyListeners();
  }

  void setIsLoading(bool val) {
    _isLoading = val;
    notifyListeners();
  }
}
