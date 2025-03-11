import 'dart:convert';
import 'package:agofoods/Utils/auth_utils.dart';
import 'package:agofoods/controllers/category_controller.dart';
import 'package:agofoods/models/api_error.dart';
import 'package:agofoods/models/drinks_model.dart';
import 'package:agofoods/models/hook_models/hook_result.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:agofoods/constants/constants.dart';

FetchHook<List<DrinksModel>> useFetchDrinksByCategory(String code) {
  final controller = Get.put(CategoryController());
  final drinks = useState<List<DrinksModel>>([]);
  final isLoading = useState<bool>(false);
  final error = useState<Exception?>(null);
  final apiError = useState<ApiError?>(null);

    var categoryValue = controller.categoryValue;

  
Future<void> fetchData() async {
  isLoading.value = true;
  try {
    String? accessToken = await getAccessToken();
    
  final url = Uri.parse('$appBaseUrl/api/drinks/byCategory/$categoryValue/$code');
    print("Fetching drinks from: $url");

    final response = await http.get(
      url,
      headers: {'Authorization': 'Bearer $accessToken'},
    );

    print("Response Status: ${response.statusCode}");
    print("Response Body: ${response.body}");

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print("Decoded Data: $data");

      final items = data['metaData']['data']['items'];
      if (items != null) {
        drinks.value = items.map<DrinksModel>((json) => DrinksModel.fromJson(json)).toList();
        print("Drinks Loaded: ${drinks.value.length}");
      } else {
        print("No drinks found!");
      }
    } else {
      print("Error: ${response.statusCode}");
      throw Exception('Error: ${response.statusCode}');
    }
  } catch (e) {
    error.value = e as Exception;
    print("Fetch Drinks Error: $e");
  } finally {
    isLoading.value = false;
  }
}


  useEffect(() {
    fetchData();
    return null;
  }, [controller.categoryValue]); 

  
  return FetchHook(
    data: drinks.value,
    isLoading: isLoading.value,
    error: error.value,
    refetch: fetchData,
  );
}