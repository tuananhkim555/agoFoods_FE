import 'dart:convert';
import 'package:agofoods/Utils/auth_utils.dart';
import 'package:agofoods/models/hook_models/hook_result.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:http/http.dart' as http;
import 'package:agofoods/constants/constants.dart';
import 'package:agofoods/models/categories.dart';
import 'package:agofoods/Utils/auth_utils.dart' as utils_upper;
import 'package:agofoods/utils/auth_utils.dart' as utils_lower;

FetchHook useFetchAllCategories() {
  final categoriesItems = useState<List<CategoriesModel>?>(null);
  final isLoading = useState<bool>(false);
  final error = useState<Exception?>(null);

  Future<void> fetchData() async {
  isLoading.value = true;
  try {
    String? accessToken = await getAccessToken();
    print('Access Token: $accessToken'); // Log access token

    final url = Uri.parse('$appBaseUrl/api/categories');
    final response = await http.get(
      url,
      headers: {'Authorization': 'Bearer $accessToken'},
    );

    print('API Response Status Code: ${response.statusCode}');
    print('API Response Body: ${response.body}');

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      final List<dynamic> metaData = jsonResponse['metaData'];
      categoriesItems.value = metaData.map((json) => CategoriesModel.fromJson(json)).toList();
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
    categoriesItems.value = null;
    isLoading.value = true;
    error.value = null;
    await fetchData();
  }

  return FetchHook(
    data: categoriesItems.value ?? [],
    isLoading: isLoading.value,
    error: error.value,
    refetch: refetch,
  );
}