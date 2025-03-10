import 'package:agofoods/common/app_style.dart';
import 'package:agofoods/common/shimmers/categories_shimmer.dart';
import 'package:agofoods/constants/constants.dart';
import 'package:agofoods/models/categories.dart';
import 'package:agofoods/views/home/widgets/category_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:agofoods/hooks/fetch_categories.dart';
import 'package:agofoods/views/motobike/motobike_page.dart';
import 'package:agofoods/views/car/car_page.dart';
import 'package:agofoods/views/delivery/delivery_page.dart';
import 'package:get/get.dart';

class CategoryList extends HookWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResult = useFetchCategories();
    List<CategoriesModel>? categoriesList = hookResult.data ?? [];
    final isLoading = hookResult.isLoading;

    // Kiểm tra và xử lý danh sách categories
    if (categoriesList!.isNotEmpty) {
      // Tìm category 'tat_ca'
      CategoriesModel? tatCaCategory =
          categoriesList.firstWhereOrNull((cat) => cat.value == 'tat_ca');

      if (tatCaCategory != null) {
        // Xóa tatCaCategory khỏi vị trí hiện tại
        categoriesList.remove(tatCaCategory);

        // Thêm vào vị trí thứ 4 (index 3) hoặc cuối danh sách nếu danh sách ngắn hơn
        int insertPosition =
            categoriesList.length >= 4 ? 4 : categoriesList.length;
        categoriesList.insert(insertPosition, tatCaCategory);
      }

      // Log để kiểm tra
      print("📌 Categories List length: ${categoriesList.length}");
      print(
          "📌 Categories values: ${categoriesList.map((e) => e.value).toList()}");
    }

    // Danh mục tĩnh
    final List<Map<String, dynamic>> staticCategories = [
      {
        "title": "Xe máy",
        "imageUrl": "assets/images/motobike.png",
        "page": const MotorbikePage()
      },
      {
        "title": "Ô tô",
        "imageUrl": "assets/images/car.png",
        "page": const CarPage()
      },
      {
        "title": "Giao hàng",
        "imageUrl": "assets/images/delivery.png",
        "page": const DeliveryPage()
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        isLoading
            ? const CategoriesShimmer()
            : SizedBox(
                height: 75.h,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: categoriesList?.length ?? 0,
                  separatorBuilder: (_, __) => const SizedBox(),
                  itemBuilder: (context, index) {
                    print(
                        "📌 Rendering Category: ${categoriesList?[index].title} (${categoriesList?[index].value})");
                    return CategoryWidget(category: categoriesList![index]);
                  },
                ),
              ),

        SizedBox(height: 7.h), // Khoảng cách giữa 2 danh mục

        SizedBox(
          height: 75.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding:
                EdgeInsets.symmetric(horizontal: 20.w), // Căn chỉnh đều hai bên
            itemCount: staticCategories.length,
            separatorBuilder: (_, __) =>
                SizedBox(width: 25.w), // Khoảng cách giống phía trên
            itemBuilder: (context, index) {
              final category = staticCategories[index];
              return GestureDetector(
                onTap: () =>
                    Get.to(category["page"], transition: Transition.fadeIn),
                child: Column(
                  children: [
                    SizedBox(
                      height:
                          45.h, // Giữ kích thước hình ảnh bằng với danh mục API
                      child: Image.asset(category["imageUrl"],
                          fit: BoxFit.contain),
                    ),
                    SizedBox(height: 7.h),
                    Text(
                      category["title"],
                      style: appStyle(11.sp, kGrayDark, FontWeight.w600),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
