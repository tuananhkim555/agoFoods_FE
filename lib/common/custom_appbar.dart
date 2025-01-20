import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:agofoods/constants/constants.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final bool showBackButton;
  final List<Widget>? actions;

  const CustomAppBar({
    super.key,
    required this.title,
    this.showBackButton = false,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140.h,
      width: width,
      color: kOffWhite,
      child: Container(
        margin: EdgeInsets.only(top: 20.h),
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Row(
          children: [
            // Avatar
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: kWhite, width: 2),
              ),
              child: CircleAvatar(
                radius: 20.r,
                backgroundColor: kPrimary,
                backgroundImage: const AssetImage('assets/images/Logo.png'),
              ),
            ),

            // Search Input
            Expanded(
              child: Container(
                height: 45.h,
                margin: EdgeInsets.symmetric(horizontal: 10.w),
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.r),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.search, color: Colors.grey),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Tìm món ăn',
                          border: InputBorder.none,
                          hintStyle: appStyle(14, Colors.grey, FontWeight.w400),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Notification Icon
            Stack(
              children: [
                IconButton(
                  onPressed: () {
                    // Xử lý khi nhấn vào thông báo
                  },
                  icon: Icon(Icons.notifications_outlined,
                      size: 25.sp, color: kPrimary),
                ),
                Positioned(
                  right: 8,
                  top: 8,
                  child: Container(
                    width: 8.w,
                    height: 8.w,
                    decoration: const BoxDecoration(
                      color: kRed,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),

            // Message Icon
            Stack(
              children: [
                IconButton(
                  onPressed: () {
                    // Xử lý khi nhấn vào tin nhắn
                  },
                  icon: Icon(Boxicons.bxs_message_alt_detail,
                      size: 25.sp, color: kPrimary),
                ),
                Positioned(
                  right: 8,
                  top: 8,
                  child: Container(
                    width: 8.w,
                    height: 8.w,
                    decoration: const BoxDecoration(
                      color: kRed,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  appStyle(int i, MaterialColor grey, FontWeight w400) {
    return TextStyle(
      fontSize: i.sp,
      color: grey,
      fontWeight: w400,
    );
  }
}
