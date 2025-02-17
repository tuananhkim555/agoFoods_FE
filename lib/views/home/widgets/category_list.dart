// ignore_for_file: non_constant_identifier_names

import 'package:agofoods/common/shimmers/categories_shimmer.dart';
import 'package:agofoods/models/categories.dart';
import 'package:agofoods/views/home/widgets/category_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:agofoods/hooks/fetch_categories.dart';
class CategoryList extends HookWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
  final hookResult = useFetchCategories();    
  List<CategoriesModel>? categoriesList = hookResult.data ?? [];
  final isLoading = hookResult.isLoading;
  final error = hookResult.error;
  

  return isLoading 
    ? const CategoriesShimmer() 
    : Container(
  height: 75.h,
  padding: EdgeInsets.only(left: 12.w),
  child:  ListView(
      scrollDirection: Axis.horizontal,
      children: List.generate(categoriesList!.length, (i) {
        CategoriesModel category = categoriesList[i];
        return CategoryWidget(
          category: category,
        );
      }),
    ),
);
  }
}
