import 'package:agofoods/common/app_style.dart';
import 'package:agofoods/common/reusable_text.dart';
import 'package:agofoods/constants/constants.dart';
import 'package:flutter/material.dart';

class OutstandingDrinksPage extends StatelessWidget {
  const OutstandingDrinksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.3,
        backgroundColor: kOffWhite,
        title: ReusableText(text: "Đồ uống nổi bật",
        style: appStyle(13, kGray, FontWeight.w600),
        ),
      ),
      body: const Center(
        child: Text('Đồ uống nổi bật'),
      ),
    );
  }
}