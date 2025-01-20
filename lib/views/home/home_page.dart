import 'package:agofoods/common/custom_container.dart';
import 'package:agofoods/common/heading.dart';
import 'package:agofoods/constants/constants.dart';
import 'package:agofoods/views/home/drinks_near_you_page.dart';
import 'package:agofoods/views/home/food_near_you_page.dart';
import 'package:agofoods/views/home/food_new_page.dart';
import 'package:agofoods/views/home/outstanding_dish_page.dart';
import 'package:agofoods/views/home/outstanding_drinks_page.dart';
import 'package:agofoods/views/home/widgets/category_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:agofoods/common/custom_appbar.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kOffWhite,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(130.h),
          child: CustomAppBar(
            title: 'AGO Foods',
            actions: [
              IconButton(
                icon: Icon(Icons.notifications_outlined,
                    color: kPrimary, size: 24.h),
                onPressed: () {},
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: CustomContainer(containerContent: Column(
            children: [
             const CategoryList(),
              Heading(
                text: 'Món ăn nổi bật', 
                onTap: () {
                  Get.to(() => const OutstandingDish(),
                  transition: Transition.cupertino,
                  duration: const Duration(milliseconds: 400));
                },
                ),

                Heading(
                text: 'Món mới', 
                onTap: () {
                  Get.to(() => const FoodNewPage(),
                  transition: Transition.cupertino,
                  duration: const Duration(milliseconds: 400));
                },
                ),

                Heading(
                text: 'Món gần bạn', 
                onTap: () {
                  Get.to(() => const FoodNearYouPage(),
                  transition: Transition.cupertino,
                  duration: const Duration(milliseconds: 400));
                },
                ),

                Heading(
                text: 'Đồ uống nổi bật', 
                onTap: () {
                  Get.to(() => const OutstandingDrinksPage(),
                  transition: Transition.cupertino,
                  duration: const Duration(milliseconds: 400));
                },
                ),
                Heading(
                text: 'Đồ uống gần bạn', 
                onTap: () {
                  Get.to(() => const DrinksNearYouPage(),
                  transition: Transition.cupertino,
                  duration: const Duration(milliseconds: 400));
                },
                ),
            ],
          )),
        ));
  }
}
