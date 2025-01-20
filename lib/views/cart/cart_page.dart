import 'package:agofoods/common/custom_appbar.dart';
import 'package:agofoods/common/custom_container.dart';
import 'package:agofoods/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kOffWhite,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(130.h),
          child: CustomAppBar(
            title: 'Giỏ hàng',
            actions: [
              IconButton(
                icon: const Icon(Icons.notifications_outlined, color: kPrimary),
                onPressed: () {},
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: CustomContainer(containerContent: Container()),
        ));
  }
}
