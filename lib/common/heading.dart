import 'package:agofoods/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Heading extends StatelessWidget {
  const Heading({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
    this.trailingIcon = Boxicons.bxs_grid_alt,
    this.more = true, // Mặc định là icon mũi tên
  });

  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final IconData? trailingIcon; // Icon bên phải
  final bool more;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
        child: more == true
            ? GestureDetector(
                onTap: onTap,
                child: Row(
                  children: [
                    Icon(icon, color: kPrimary, size: 20.h),
                    SizedBox(width: 5.w),
                    Expanded(
                      child: Text(
                        title,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Icon(trailingIcon, color: kPrimary, size: 20.h),
                  ],
                ),
              )
            : const SizedBox.shrink());
  }
}
