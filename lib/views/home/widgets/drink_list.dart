import 'package:agofoods/common/shimmers/neabry_shimmer.dart';
import 'package:agofoods/constants/uidata.dart';
import 'package:agofoods/hooks/fetch_drinks.dart';
import 'package:agofoods/models/drinks_model.dart';
import 'package:agofoods/views/home/widgets/drink_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DrinkList extends HookWidget {
  const DrinkList({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResults = useFetchAllDrinks('345345345');
    List<DrinksModel>? drinks = hookResults.data;
    final isLoading = hookResults.isLoading;
    return Container(
      height: 165.h,
      padding: EdgeInsets.only(left: 12.w, top: 10.h),
      child: isLoading
          ? const NeabryShimmer()
          : ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(drinks!.length, (i) {
                var drink = drinks[i];
                return DrinkWidget(
                  image: drink.imageUrl![0],
                  title: drink.title,
                  time: drink.time,
                  price: formatPriceVND(drink.price ?? 0.0),
                  onTap: () {},
                );
              }),
            ),
    );
  }
}
