import 'package:agofoods/models/categories.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  RxString _category = ''.obs; // Lưu categoryId hiện tại
  RxString _title = ''.obs; // Lưu tên danh mục hiện tại
  final RxBool _isFoodCategory = true.obs; // Kiểm tra loại danh mục (FOOD/DRINK)

  // Biến để theo dõi danh mục hiện tại
  RxString currentCategoryId = ''.obs;

  RxList<CategoriesModel> categories = <CategoriesModel>[].obs;
  Rx<CategoriesModel?> selectedCategory = Rx<CategoriesModel?>(null);

  var foodsList = <dynamic>[].obs;
  var drinksList = <dynamic>[].obs;

  String get categoryValue => _category.value;
  String get titleValue => _title.value;
  bool get isFoodCategory => _isFoodCategory.value;

  /// Cập nhật categoryId và các trạng thái liên quan
  void updateCategory(String newCategoryId, String newTitle, String type) {
    if (newCategoryId.isEmpty || newTitle.isEmpty) {
      print("❌ Invalid categoryId or title: categoryId='$newCategoryId', title='$newTitle'");
      return;
    }

    // Cập nhật categoryId, title và type
    _category.value = newCategoryId; // Đồng bộ categoryValue với categoryId
    _title.value = newTitle;
    _isFoodCategory.value = (type == CategoriesModel.TYPE_FOOD);

    // Xóa danh sách foods/drinks cũ
    clearLists();

    print("✅ Updated category: $newCategoryId - $newTitle - Type: $type");
  }

   void setCategory(String category, String title, String type) {
    print('📌 Set Category: $category - $title - Type: $type');

    if (category == _category.value) {
      _category.value = "";
      _title.value = "";
      print('🔄 Category reset');
      return;
    }

    _category.value = category;
    _title.value = title;
    _isFoodCategory.value = (type == CategoriesModel.TYPE_FOOD);

    foodsList.clear();
    drinksList.clear();
    print('🔍 foodsList cleared: ${foodsList.length}');
  }

  /// Reset trạng thái về mặc định
  void resetCategory() {
    _category.value = "";
    _title.value = "";
    _isFoodCategory.value = true; // Mặc định là FOOD
    clearLists();
    print("🔄 Category reset");
  }

  /// Xóa danh sách foods và drinks
  void clearLists() {
    foodsList.clear();
    drinksList.clear();
    print("🔍 Cleared foodsList and drinksList");
  }
}