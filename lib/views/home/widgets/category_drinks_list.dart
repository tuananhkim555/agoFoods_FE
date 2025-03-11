import 'package:agofoods/common/shimmers/drinklist_shimmer.dart';
import 'package:agofoods/constants/constants.dart';
import 'package:agofoods/hooks/fetch_category_drinks.dart';
import 'package:agofoods/models/drinks_model.dart';
import 'package:agofoods/views/home/widgets/drink_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryDrinksList extends HookWidget {
  const CategoryDrinksList({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResults = useFetchDrinksByCategory('345345345');
    List<DrinksModel>? drinks = hookResults.data;
    final isLoading = hookResults.isLoading;

    useEffect(() {
      drinks = hookResults.data;
      return null;
    }, [hookResults.data]); // Cập nhật mỗi khi hookResults.data thay đổi

    return SizedBox(
      width: width,
      height: height,
      child: isLoading
          ? const DrinkListShimmer()
          : Padding(
              padding: EdgeInsets.all(12.h),
              child: ListView(
                  children: List.generate(
                drinks!.length,
                (i) {
                  DrinksModel drink = drinks![i];
                  return DrinkTitle(
                    color: Colors.white,
                    drinks: drink,
                  );
                },
              )),
            ),
    );
  }
}
