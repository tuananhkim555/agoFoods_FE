import 'package:agofoods/common/reusable_text.dart';
import 'package:agofoods/constants/constants.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kOffWhite,
        title: const ReusableText(text: 'Category Page'),
      ),
    );
  }
}
