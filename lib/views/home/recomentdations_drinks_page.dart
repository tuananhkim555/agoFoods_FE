import 'package:agofoods/common/app_style.dart';
import 'package:agofoods/common/background_container.dart';
import 'package:agofoods/common/reusable_text.dart';
import 'package:agofoods/common/shimmers/drinklist_shimmer.dart';
import 'package:agofoods/constants/constants.dart';
import 'package:agofoods/hooks/fetch_drinks.dart';
import 'package:agofoods/models/drinks_model.dart';
import 'package:agofoods/views/home/widgets/drink_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecomentdationsDrinksPage extends HookWidget {
  const RecomentdationsDrinksPage({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResults = useFetchAllDrinks('345345345');
    List<DrinksModel>? drinks = hookResults.data;
    final isLoading = hookResults.isLoading;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.3,
        backgroundColor: kPrimary,
        title: ReusableText(text: "Đồ uống để cử",
        style: appStyle(13, kWhite, FontWeight.w600),
        ),
      ),
      body: BackgroundContainer(
        color: Colors.white,
        child: isLoading 
          ? const DrinkListShimmer() 
          :  Padding(
          padding: EdgeInsets.all(12.h),
          child: ListView(
            children: List.generate(drinks!.length, (i) {
              DrinksModel drink = drinks[i];
              return DrinkTitle(drinks: drink);
            }),
          ),
        
        ),
      ),
    );
  }
}