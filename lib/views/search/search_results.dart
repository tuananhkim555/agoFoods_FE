import 'package:agofoods/controllers/search_controller.dart';
import 'package:agofoods/models/base_food_drink_model.dart';
import 'package:agofoods/models/drinks_model.dart';
import 'package:agofoods/models/foods_model.dart';
import 'package:agofoods/views/home/widgets/drink_title.dart';
import 'package:agofoods/views/home/widgets/food_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';




class SearchResults extends StatelessWidget {
  const SearchResults({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SearchFoodsDrinksController>();

    // Kiểm tra nếu searchResults null hoặc rỗng
    if (controller.searchResults == null || controller.searchResults!.isEmpty) {
      return const Center(
        child: Text(
          "Không tìm thấy kết quả nào!",
          style: TextStyle(color: Colors.black54),
        ),
      );
    }

   return Transform.translate(
  offset: Offset(0, -70.h), // Dịch toàn bộ widget lên trên 30px
  child: Container(
    padding: EdgeInsets.fromLTRB(12.w, 10.h, 12.w, 0),
    constraints: BoxConstraints(
      maxHeight: MediaQuery.of(context).size.height * 0.5,
    ),
    child: ListView.builder(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemCount: controller.searchResults!.length,
      itemBuilder: (context, i) {
        BaseFoodDrinkModel item = controller.searchResults![i];
        if (item is FoodsModel) {
          return FoodTitle(foods: item);
        } else if (item is DrinksModel) {
          return DrinkTitle(drinks: item);
        } else {
          return const SizedBox.shrink();
        }
      },
    ),
  ),
);

  }
}