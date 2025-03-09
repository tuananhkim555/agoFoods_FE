import 'dart:convert';
import 'package:agofoods/Utils/auth_utils.dart';
import 'package:agofoods/models/hook_models/hook_result.dart';
import 'package:agofoods/models/restaurants_model.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:http/http.dart' as http;
import 'package:agofoods/constants/constants.dart';

FetchHook<List<RestaurantsModel>> useFetchRestaurants(String code) {
  final restaurants = useState<List<RestaurantsModel>?>(null);
  final isLoading = useState<bool>(false);
  final error = useState<Exception?>(null);

Future<void> fetchData() async {
  isLoading.value = true;
  try {
    String? accessToken = await getAccessToken();
    final url = Uri.parse('$appBaseUrl/api/restaurants/all/$code');
    final response = await http.get(
      url,
      headers: {'Authorization': 'Bearer $accessToken'},
    );

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);

      // Truy cập đúng vào allNearByRestaurants
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

  return FetchHook<List<RestaurantsModel>>(
  data: restaurants.value ?? [],
  isLoading: isLoading.value,
  error: error.value,
  refetch: refetch,
);
}