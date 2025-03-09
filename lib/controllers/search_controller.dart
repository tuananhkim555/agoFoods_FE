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
  RxList<BaseFoodDrinkModel> searchResults = <BaseFoodDrinkModel>[].obs;
  final RxString _searchTerm = ''.obs;

  bool get isLoading => _isLoading.value;
  set setLoading(bool value) => _isLoading.value = value;

  void searchFoodsDrinks(String key) {
  _searchTerm.value = key;

  // Gọi ngay API nếu lần đầu tiên
  if (searchResults.isEmpty) {
    _fetchData(key);
  }

  // Dùng debounce để giảm số lần gọi API nếu user nhập liên tục
  debounce(_searchTerm, (value) => _fetchData(value), time: const Duration(milliseconds: 500));
}

  Future<void> _fetchData(String key) async {
    if (key.isEmpty) return;
    setLoading = true;
    searchResults.clear();

    Uri url = Uri.parse('$appBaseUrl/api/foods/drinks/search?searchTerm=$key');
    debugPrint("\ud83c\udf0d URL API gọi: $url");

    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        if (jsonData is Map<String, dynamic> && jsonData.containsKey("metaData")) {
          var metaData = jsonData["metaData"];
          
          Set<BaseFoodDrinkModel> uniqueResults = {};

          if (metaData.containsKey("foods") && metaData["foods"] is List) {
            for (var item in metaData["foods"]) {
              try {
                uniqueResults.add(FoodsModel.fromJson(item));
              } catch (e) {
                debugPrint("Lỗi parse FoodsModel: $e");
              }
            }
          }
          
          if (metaData.containsKey("drinks") && metaData["drinks"] is List) {
            for (var item in metaData["drinks"]) {
              try {
                uniqueResults.add(DrinksModel.fromJson(item));
              } catch (e) {
                debugPrint("Lỗi parse DrinksModel: $e");
              }
            }
          }
          
          searchResults.assignAll(uniqueResults.toList());
        }
      } else {
        debugPrint("\ud83d\udea8 API Error: ${response.statusCode} - ${response.body}");
      }
    } catch (e) {
      debugPrint("\ud83d\udea8 Exception: $e");
    }
    setLoading = false;
  }
}