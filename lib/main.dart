import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:svfoods/features/auth/screens/create_account.dart';
import 'package:svfoods/features/auth/screens/login.dart';
import 'package:svfoods/features/bottombar/bottombar.dart';
import 'package:svfoods/provider/user_provider.dart';
import 'package:svfoods/utils/router.dart';

void main() {
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => UserProvider())],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) => generateRoute(settings),
      home: const Login(),
    );
  }
}
