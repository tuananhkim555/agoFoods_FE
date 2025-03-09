import 'dart:convert';
import 'package:agofoods/Utils/auth_utils.dart';
import 'package:agofoods/models/drinks_model.dart';
import 'package:agofoods/models/api_error.dart';
import 'package:agofoods/models/hook_models/hook_result.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:http/http.dart' as http;
import 'package:agofoods/constants/constants.dart';

FetchHook<List<DrinksModel>> useFetchAllDrinks(String code) {
  final drinks = useState<List<DrinksModel>?>(null);
  final isLoading = useState<bool>(false);
  final error = useState<Exception?>(null);
  final apiError = useState<ApiError?>(null);

  Future<void> fetchData() async {
    isLoading.value = true;
    try {
      // Get access token
      String? accessToken = await getAccessToken();
      print('Access Token: $accessToken'); // Log access token

      // Fetch data from the API
      final url = Uri.parse('$appBaseUrl/api/drinks/random/$code');
      final response = await http.get(
        url,
        headers: {'Authorization': 'Bearer $accessToken'},
      );

      // Log API response for debugging

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);

        // Correctly access the nested `data` list
        final List? drinksList = jsonResponse['metaData']['data'] as List?;

        if (drinksList != null) {
          drinks.value = drinksList.map((json) => DrinksModel.fromJson(json)).toList();
        } else {
          drinks.value = [];
        }
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      error.value = Exception('An unexpected error occurred: $e');
    } finally {
      isLoading.value = false;
    }
  }

  useEffect(() {
    fetchData();
    return null;
  }, []);

  void refetch() async {
    drinks.value = null;
    isLoading.value = true;
    error.value = null;
    apiError.value = null;
    await fetchData();
  }

  return FetchHook<List<DrinksModel>>(
    data: drinks.value ?? [],
    isLoading: isLoading.value,
    error: error.value,
    refetch: refetch,
  );
}