import 'package:flutter/material.dart';
import 'package:svfoods/common/dialogs/response_dialog.dart';
import 'package:svfoods/models/food_item.dart';
import 'package:svfoods/services/food_service.dart';

class FoodProvider extends ChangeNotifier {
  FoodService foodService = FoodService();

  List<FoodItem> foods = [];
  bool isLoading = false;

  Future<void> loadFoods(BuildContext context) async {
    try {
      isLoading = true;
      notifyListeners();
      foods = await foodService.fetchFoods();
    } catch (e) {
      ResponseDialog.showErrorResponseDialog(
          context: context, errorMessage: e.toString());
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
