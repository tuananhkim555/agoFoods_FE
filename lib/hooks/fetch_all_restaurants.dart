import 'dart:convert';
import 'package:agofoods/Utils/auth_utils.dart';
import 'package:agofoods/models/hook_models/hook_result.dart';
import 'package:agofoods/models/restaurants_model.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:http/http.dart' as http;
import 'package:agofoods/constants/constants.dart';

FetchHook useFetchAllRestaurants(String code) {
  final restaurants = useState<List<RestaurantsModel>?>(null);
  final isLoading = useState<bool>(false);
  final error = useState<Exception?>(null);

  Future<void> fetchData() async {
    isLoading.value = true;
    try {
      // Get access token
      String? accessToken = await getAccessToken();
      print('Access Token: $accessToken'); // Log access token

      // Fetch data from the API
      final url = Uri.parse('$appBaseUrl/api/restaurants/all/$code');
      final response = await http.get(
        url,
        headers: {'Authorization': 'Bearer $accessToken'},
      );

      // Log API response for debugging

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);

        // Correctly access the nested `allNearByRestaurants` list
        final List<dynamic>? allNearByRestaurants =
            jsonResponse['metaData']['metaData']['allNearByRestaurants'] as List<dynamic>?;

        if (allNearByRestaurants != null) {
          restaurants.value = allNearByRestaurants
              .map((json) => RestaurantsModel.fromJson(json))
              .toList();
        } else {
          restaurants.value = [];
        }
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      error.value = Exception('An unexpected error occurred: $e');
      print('Error: $e'); // Log lỗi
    } finally {
      isLoading.value = false;
    }
  }

  useEffect(() {
    fetchData();
    return null;
  }, []);

  void refetch() async {
    restaurants.value = null;
    isLoading.value = true;
    error.value = null;
    await fetchData();
  }

  return FetchHook(
    data: restaurants.value,
    isLoading: isLoading.value,
    error: error.value,
    refetch: refetch,
  );
}