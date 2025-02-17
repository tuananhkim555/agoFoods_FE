import 'package:agofoods/common/app_style.dart';
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
      height: 160.h,
      width: width,
      color: kOffWhite,
      padding: EdgeInsets.only(top: 60.h),
      child: Column(
        children: [
          // Location Bar
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              children: [
                Icon(Icons.location_on_rounded, color: kPrimary, size: 22.sp),
                SizedBox(width: 8.w),
                Expanded(
                  child: Text(
                    'Địa chỉ của bạn',
                    style: appStyle(14, Colors.grey.shade600, FontWeight.w500),
                  ),
                ),
                Icon(Icons.keyboard_arrow_down, color: kPrimary, size: 24.sp),
              ],
            ),
          ),

          SizedBox(height: 15.h),

          // Search and Actions Bar
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              children: [
                // Avatar
                Container(
                  width: 42.w,
                  height: 42.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(color: kWhite, width: 2),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/Logo.png'),
                      fit: BoxFit.cover,
                    ),
                    color: kPrimary,
                  ),
                ),

                // Search Input
                Expanded(
                  child: Container(
                    height: 45.h,
                    margin: EdgeInsets.symmetric(horizontal: 12.w),
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(color: Colors.grey.shade300),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade100,
                          offset: const Offset(0, 2),
                          blurRadius: 4,
                        )
                      ],
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.search,
                            color: Colors.grey.shade600, size: 22.sp),
                        SizedBox(width: 10.w),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Tìm món ăn',
                              border: InputBorder.none,
                              hintStyle: appStyle(
                                  14, Colors.grey.shade400, FontWeight.w400),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Action Buttons
                Row(
                  children: [
                    _buildActionButton(
                      icon: Icons.notifications_outlined,
                      onPressed: () {
                        // Xử lý khi nhấn vào thông báo
                      },
                    ),
                    SizedBox(width: 8.w),
                    _buildActionButton(
                      icon: Boxicons.bxs_message_alt_detail,
                      onPressed: () {
                        // Xử lý khi nhấn vào tin nhắn
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return Stack(
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(icon, size: 25.sp, color: kPrimary),
          padding: EdgeInsets.all(8.w),
          constraints: BoxConstraints(
            minHeight: 40.h,
            minWidth: 40.w,
          ),
        ),
        Positioned(
          right: 6,
          top: 6,
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
    );
  }
}
