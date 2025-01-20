import 'package:agofoods/common/custom_container.dart';
import 'package:agofoods/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:agofoods/common/custom_appbar.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kOffWhite,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(130.h),
          child: const CustomAppBar(
            title: 'Tìm kiếm',    
          ),
        ),
        body: SafeArea(
          child: CustomContainer(containerContent: Container()),
        ));
  }
}
