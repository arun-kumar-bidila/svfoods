import 'package:flutter/material.dart';
import 'package:svfoods/features/auth/screens/create_account.dart';
import 'package:svfoods/features/auth/screens/login.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case CreateAccount.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => CreateAccount());
    case Login.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => Login());
    // case EmailVerification.routeName:
    //   return MaterialPageRoute(
    //       settings: routeSettings, builder: (_) => EmailVerification());
    // case ForgotPassword.routeName:
    //   return MaterialPageRoute(
    //       settings: routeSettings, builder: (_) => ForgotPassword());
    // case ResetPassword.routeName:
    //   return MaterialPageRoute(
    //       settings: routeSettings, builder: (_) => ResetPassword());
    default:
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => Scaffold(
                body: Center(
                  child: Text("This route doesn't exist "),
                ),
              ));
  }
}
