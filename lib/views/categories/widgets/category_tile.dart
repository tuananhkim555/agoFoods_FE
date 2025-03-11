import 'package:agofoods/common/app_style.dart';
import 'package:agofoods/common/reusable_text.dart';
import 'package:agofoods/constants/constants.dart';
import 'package:agofoods/controllers/category_controller.dart';
import 'package:agofoods/models/categories.dart';
import 'package:agofoods/views/categories/category_drink_page.dart';
import 'package:agofoods/views/categories/category_foods_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
// ignore: must_be_immutable
class CategoryTile extends StatelessWidget {
  final CategoriesModel category;
  final Color? textColor;

  const CategoryTile({
    super.key,
    required this.category,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CategoryController>();

    return ListTile(
      onTap: () {
        if (category.id != null && category.type != null) {
          // Kiểm tra nếu danh mục hiện tại trùng với danh mục được chọn
          if (controller.currentCategoryId.value == category.id) {
            print("📌 Back to home page from category: ${category.title}");
            Get.back(); // Quay lại trang chính
            return;
          }

          // Cập nhật danh mục hiện tại
          controller.currentCategoryId.value = category.id!;

          // Điều hướng đến trang chi tiết
          if (category.type == CategoriesModel.TYPE_DRINK) {
            Get.to(
              () => CategoryDrinksPage(
                categoryId: category.id!,
                categoryTitle: category.title ?? "Đồ uống",
              ),
              transition: Transition.fadeIn,
              duration: const Duration(milliseconds: 300),
            );
          } else if (category.type == CategoriesModel.TYPE_FOOD) {
            Get.to(
              () => CategoryFoodsPage(
                categoryId: category.id!,
                categoryTitle: category.title ?? "Món ăn",
              ),
              transition: Transition.fadeIn,
              duration: const Duration(milliseconds: 300),
            );
          }
        } else {
          // Xử lý trường hợp categoryId hoặc type bị null
          print('Category ID or Type is null');
        }
      },
      leading: CircleAvatar(
        radius: 18.r,
        backgroundColor: kGrayLight,
        child: Image.network(
          category.imageUrl,
          fit: BoxFit.contain,
        ),
      ),
      title: ReusableText(
        text: category.title ?? "",
        style: appStyle(12, textColor ?? kGrayDark, FontWeight.w500),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios_rounded,
        color: kGray,
        size: 15.r,
      ),
    );
  }
}