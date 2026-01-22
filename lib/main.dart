import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:svfoods/common/widgets/splash_screen.dart';

import 'package:svfoods/features/auth/screens/login.dart';
import 'package:svfoods/features/bottombar/bottombar.dart';
import 'package:svfoods/provider/food_provider.dart';
import 'package:svfoods/provider/user_provider.dart';
import 'package:svfoods/services/user_service.dart';
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
  final UserService userService = UserService();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      userService.getUserData(context: context);
    });
  }
  

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      onGenerateRoute: generateRoute,
      home: userProvider.isLoading
          ? const SplashScreen()
          : userProvider.user.email.isNotEmpty
              ? const Bottombar()
              : const Login(),
    );
  }
}
