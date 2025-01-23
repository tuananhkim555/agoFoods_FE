import 'package:agofoods/constants/uidata.dart';
import 'package:agofoods/views/home/widgets/outstanding_dish_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OutstandingDishList extends StatelessWidget {
  const OutstandingDishList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190.h,
      padding: EdgeInsets.only(left: 12.w, top: 10.h),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(restaurants.length, (i) {
          // ignore: unused_local_variable
          var restaurant = restaurants[i];
          return OutstandingDishWidget(
            image: restaurant['imageUrl'],
            logo: restaurant['logoUrl'],
            title: restaurant['title'],
            time: restaurant['time'],
            rating: restaurant['ratingCount'],
            onTap: () {},
          );
        }),
      ),
    );
  }
}
