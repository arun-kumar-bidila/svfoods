import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:svfoods/common/dialogs/response_dialog.dart';
import 'package:svfoods/models/food_item.dart';
import 'package:http/http.dart' as http;
import 'package:svfoods/utils/app_colors.dart';

class FoodService {
  Future<List<FoodItem>> fetchFoods(BuildContext context) async {
    try {
      final response = await http.get(Uri.parse("$uri/api/food/listfood"),
          headers: {"Content-Type": "application/json"});

      final jsonData = jsonDecode(response.body);

      final List list = jsonData["data"];

      return list.map((e) => FoodItem.fromJson(e)).toList();
    } catch (e) {
      ResponseDialog.showErrorResponseDialog(
          context: context, errorMessage: e.toString());
      throw Exception("Failed to load foods");
    }
  }
}
