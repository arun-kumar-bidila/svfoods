import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:svfoods/provider/food_provider.dart';

import 'package:svfoods/utils/app_colors.dart';

class CategoryFoods extends StatefulWidget {
  static const String routeName = "/category-foods";
  final String categoryName;
  const CategoryFoods({super.key, required this.categoryName});

  @override
  State<CategoryFoods> createState() => _CategoryFoodsState();
}

class _CategoryFoodsState extends State<CategoryFoods> {
  @override
  Widget build(BuildContext context) {
    final foods = Provider.of<FoodProvider>(context).foods;
    final filteredFoods = foods
        .where((p) =>
            p.category.toLowerCase() == widget.categoryName.toLowerCase())
        .toList();
    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Colors.green,
                  size: 24,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "${widget.categoryName} (${filteredFoods.length})",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.green),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: GridView.builder(
                    itemCount: filteredFoods.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.65,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10),
                    itemBuilder: (context, index) {
                      final food = filteredFoods[index];
                      return Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: AppColors.backgroundDark,
                            border:
                                Border.all(color: Colors.white, width: 1.5)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(8)),
                                child: Image.network(
                                  "$uri/images/${food.image}",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
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
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
