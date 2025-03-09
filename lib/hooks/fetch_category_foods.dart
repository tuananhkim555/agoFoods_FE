import 'dart:convert';
import 'package:agofoods/Utils/auth_utils.dart';
import 'package:agofoods/controllers/category_controller.dart';
import 'package:agofoods/models/api_error.dart';
import 'package:agofoods/models/foods_model.dart';
import 'package:agofoods/models/hook_models/hook_result.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:agofoods/constants/constants.dart';

FetchHook<List<FoodsModel>> useFetchFoodsByCategory(String code) {
  final controller = Get.put(CategoryController());
  final foods = useState<List<FoodsModel>>([]);
  final isLoading = useState<bool>(false);
  final error = useState<Exception?>(null);
  final apiError = useState<ApiError?>(null);

  Future<void> fetchData() async {
    isLoading.value = true;
    try {
      String? accessToken = await getAccessToken();
      final url = Uri.parse('$appBaseUrl/api/foods/byCategory/${controller.categoryValue}/$code');
      
      final response = await http.get(
        url,
        headers: {'Authorization': 'Bearer $accessToken'},
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body)['metaData']['data']['items'];
        foods.value = data.map<FoodsModel>((json) => FoodsModel.fromJson(json)).toList();
      } else {
        throw Exception('Error: ${response.statusCode}');
      }
    } catch (e) {
      error.value = e as Exception;
    } finally {
      isLoading.value = false;
    }
  }

  useEffect(() {
    fetchData();
    return null;
  }, [controller.categoryValue]); 

  
  return FetchHook(
    data: foods.value,
    isLoading: isLoading.value,
    error: error.value,
    refetch: fetchData,
  );
}