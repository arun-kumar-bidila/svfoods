import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:svfoods/features/cart/cart.dart';
import 'package:svfoods/features/home/screens/home.dart';
import 'package:svfoods/features/orders/orders.dart';
import 'package:svfoods/features/profile/profile.dart';
import 'package:svfoods/provider/user_provider.dart';
import 'package:svfoods/utils/app_colors.dart';

class Bottombar extends StatefulWidget {
  static const String routeName = "/bottombar";
  const Bottombar({super.key});

  @override
  State<Bottombar> createState() => _BottombarState();
}

class _BottombarState extends State<Bottombar> {
  int page = 0;

  List<Widget> pages = [Home(), Cart(), Orders(), Profile()];

  void updatePage(int _page) {
    setState(() {
      page = _page;
    });
  }

  @override
  Widget build(BuildContext context) {
    // final user = Provider.of<UserProvider>(context).user;
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        
        backgroundColor: AppColors.backgroundDark,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text(
            //   "Hello,",
            //   style: TextStyle(
            //       color: AppColors.textGreen,
            //       fontWeight: FontWeight.bold,
            //       fontSize: 20),
            // ),
            Image.asset(
              "assets/logo.png",
              height: 120,
              width: 120,
            ),
            // Icon(
            //   Icons.notifications_rounded,
            //   size: 24,
            //   color: Colors.green,
            // )
          ],
        ),
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(0.5),
            child: Container(
              height: 0.5,
              color: Colors.white,
            )),
      ),
      body: pages[page],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent),
        child: Container(
          decoration: BoxDecoration(
              border: Border(top: BorderSide(color: Colors.white, width: 0.5))),
          child: BottomNavigationBar(
              backgroundColor: Colors.black,
              type: BottomNavigationBarType.fixed,
              currentIndex: page,
              onTap: updatePage,
              selectedItemColor: AppColors.iconColor,
              unselectedItemColor: AppColors.textInput,
              iconSize: 25,
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home_max_rounded), label: "Home"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.shopping_cart_outlined), label: "Plate"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.shopping_bag), label: "Orders"),
                BottomNavigationBarItem(icon: Icon(Icons.person), label: "Me")
              ]),
        ),
      ),
    );
  }
}
