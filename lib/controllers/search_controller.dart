// ignore_for_file: prefer_final_fields

import 'dart:convert';

import 'package:agofoods/constants/constants.dart';
import 'package:agofoods/models/base_food_drink_model.dart';
import 'package:agofoods/models/drinks_model.dart';
import 'package:agofoods/models/foods_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SearchFoodsDrinksController extends GetxController {
  RxBool _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  set setLoading(bool value) {
    _isLoading.value = value;
  }

RxList<BaseFoodDrinkModel> searchResults = <BaseFoodDrinkModel>[].obs;
  

 void searchFoodsDrinks(String key) async {
  setLoading = true;
  searchResults.clear();

  Uri url = Uri.parse('$appBaseUrl/api/foods/drinks/search?searchTerm=$key');
  debugPrint("Calling API: $url");

  try {
    var response = await http.get(url);
    debugPrint("Full API Response: ${response.body}");

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);

      if (jsonData is Map<String, dynamic> && jsonData.containsKey("metaData")) {
        var metaData = jsonData["metaData"];

        if (metaData.containsKey("foods") && metaData["foods"] is List) {
          searchResults.addAll(
            (metaData["foods"] as List).map((item) => FoodsModel.fromJson(item)).cast<BaseFoodDrinkModel>()
          );
        }

        if (metaData.containsKey("drinks") && metaData["drinks"] is List) {
          searchResults.addAll(
            (metaData["drinks"] as List).map((item) => DrinksModel.fromJson(item)).cast<BaseFoodDrinkModel>()
          );
        }
      }

      if (searchResults.isEmpty) {
        debugPrint("🚨 Không tìm thấy kết quả nào.");
      }
    } else {
      debugPrint("🚨 API Error: ${response.statusCode} - ${response.body}");
    }
  } catch (e) {
    debugPrint("🚨 Exception: $e");
  }

  setLoading = false;
}


}
