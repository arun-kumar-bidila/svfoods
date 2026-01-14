import 'package:flutter/material.dart';
import 'package:svfoods/features/home/screens/category_foods.dart';
import 'package:svfoods/features/home/widgets/food_display.dart';
import 'package:svfoods/utils/app_colors.dart';
import 'package:svfoods/utils/menulist.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.backgroundDark,
      body: SafeArea(
        child: Padding(
          padding:  const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              
              children: [
                Text(
                  "Categories",
                  style: const TextStyle(
                      color: Colors.green,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 120,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: menulist.length,
                      itemBuilder: (context, index) {
                        final item = menulist[index];
            
                        return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, CategoryFoods.routeName,
                                arguments: item.name);
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: CircleAvatar(
                                    radius: 35,
                                    child: Image.asset(
                                      item.image,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  item.name,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                ),
                // SizedBox(
                //   height: 10,
                // ),
                Text(
                  "Your Favourite Food",
                  style: const TextStyle(
                      color: Colors.green,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 15,
                ),
                FoodDisplay()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
