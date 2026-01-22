import 'package:flutter/material.dart';
import 'package:svfoods/features/auth/screens/create_account.dart';
import 'package:svfoods/features/auth/screens/login.dart';
import 'package:svfoods/features/bottombar/bottombar.dart';
import 'package:svfoods/features/home/screens/category_foods.dart';
import 'package:svfoods/features/home/screens/food_screen.dart';
import 'package:svfoods/models/food_item.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case CreateAccount.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => CreateAccount());
    case Login.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => Login());
    case Bottombar.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => Bottombar());
    // case EmailVerification.routeName:
    //   return MaterialPageRoute(
    //       settings: routeSettings, builder: (_) => EmailVerification());
    // case ForgotPassword.routeName:
    //   return MaterialPageRoute(
    //       settings: routeSettings, builder: (_) => ForgotPassword());
    // case ResetPassword.routeName:
    //   return MaterialPageRoute(
    //       settings: routeSettings, builder: (_) => ResetPassword());
    case CategoryFoods.routeName:
      final categoryName = routeSettings.arguments as String;
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => CategoryFoods(categoryName: categoryName));
    case FoodScreen.routeName:
      final food = routeSettings.arguments as FoodItem;
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => FoodScreen(
                food: food,
              ));
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
