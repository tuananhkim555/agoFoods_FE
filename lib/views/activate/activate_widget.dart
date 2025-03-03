import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ActivateWidget extends StatelessWidget {
  final String title;

  const ActivateWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/time_folder.png",
            width: 100.w,  // Giảm kích thước xuống
            height: 100.h, // Giảm kích thước xuống
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: Colors.grey[400],
            ),
          ),
        ],
      ),
    );
  }
}
