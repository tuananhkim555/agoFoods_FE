import 'package:agofoods/models/categories.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  RxString _category = ''.obs;
  RxString _title = ''.obs;
  final RxBool _isFoodCategory = true.obs;

  RxList<CategoriesModel> categories = <CategoriesModel>[].obs;
  Rx<CategoriesModel?> selectedCategory = Rx<CategoriesModel?>(null);

  var foodsList = <dynamic>[].obs; // ✅ Khai báo danh sách rõ ràng
  var drinksList = <dynamic>[].obs;
  // var categoryValue = "".obs;

  String get categoryValue => _category.value;
  String get titleValue => _title.value;
  bool get isFoodCategory => _isFoodCategory.value;

// void setCategory(String category) {
//     categoryValue.value = category;
//   }

  void updateCategory(String value) {
    _category.value = value;
    foodsList.clear();
    drinksList.clear();
    print("Category updated: $value");
  }

  void updateTitle(String value) {
    _title.value = value;
  }

  void setCategory(String category, String title, String type) {
    _category.value = category;
    _title.value = title;
    _isFoodCategory.value =
        (type == CategoriesModel.TYPE_FOOD); // So sánh với constant
    print(
        "Category set: $category, Title: $title, Type: $type, IsFood: ${_isFoodCategory.value}");
  }
}
