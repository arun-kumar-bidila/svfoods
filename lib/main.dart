import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:svfoods/features/auth/screens/create_account.dart';
import 'package:svfoods/features/auth/screens/login.dart';
import 'package:svfoods/features/bottombar/bottombar.dart';
import 'package:svfoods/provider/food_provider.dart';
import 'package:svfoods/provider/user_provider.dart';
import 'package:svfoods/services/user_service.dart';
import 'package:svfoods/utils/app_colors.dart';
import 'package:svfoods/utils/router.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => UserProvider()),
    ChangeNotifierProvider(create: (context) => FoodProvider())
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  UserService userService = UserService();

  @override
  void initState()  {
    // TODO: implement initState

    super.initState();
    userService.getUserData(context: context);
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    if (userProvider.isLoading) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: AppColors.backgroundDark,
          body: Center(
            child: CircularProgressIndicator(
              color: Colors.green,
            ),
          ),
        ),
      );
    }
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) => generateRoute(settings),
      home: userProvider.user.email.isNotEmpty ? Bottombar() : Login(),
    );
  }
}
