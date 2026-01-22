import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:svfoods/features/home/screens/food_screen.dart';

import 'package:svfoods/provider/food_provider.dart';
import 'package:svfoods/utils/app_colors.dart';

class FoodDisplay extends StatefulWidget {
  const FoodDisplay({super.key});

  @override
  State<FoodDisplay> createState() => _FoodDisplayState();
}

class _FoodDisplayState extends State<FoodDisplay> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask(() {
      context.read<FoodProvider>().loadFoods(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final foodprovider = context.watch<FoodProvider>();
    if (foodprovider.isLoading) {
      return Center(
          child: CircularProgressIndicator(
        color: Colors.green,
      ));
    }
    return GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.65,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemCount: foodprovider.foods.length,
        itemBuilder: (context, index) {
          final food = foodprovider.foods[index];
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, FoodScreen.routeName,
                  arguments: food);
            },
            child: Container(
              decoration: BoxDecoration(
                  color: AppColors.backgroundDark,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.white, width: 1.5)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12)),
                      child: Image.network(
                        "$uri/images/${food.image}",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          food.name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "₹${food.price}",
                          style: const TextStyle(
                              color: Colors.green,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        // Container(
                        //   alignment: Alignment.center,
                        //   margin: EdgeInsets.only(top: 6),
                        //   height: 35,
                        //   width: double.infinity,
                        //   decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.circular(6),
                        //       gradient: AppColors.loginButtonGradient),
                        //   child: Text(
                        //     "Add To Plate",
                        //     style: TextStyle(
                        //         color: Colors.black,
                        //         fontSize: 14,
                        //         fontWeight: FontWeight.bold),
                        //   ),
                        // )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
