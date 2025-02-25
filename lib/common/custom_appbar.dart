// File: custom_app_bar.dart
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatefulWidget {
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
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  int _currentTextIndex = 0; // Biến trạng thái để biết đang hiển thị gì
  late Timer _timer; // Timer để thay đổi văn bản tự động
  final List<String> _texts = ['món ăn đồ uống', 'địa điểm']; // Danh sách các văn bản
  String _displayedText = ''; // Văn bản hiện tại đang được gõ
  int _charIndex = 0; // Chỉ số ký tự hiện tại trong quá trình gõ

  late PageController _pageController; // Controller để quản lý PageView
  late Timer _slideTimer; // Timer để tự động chuyển slide
  int _currentPageIndex = 0; // Chỉ số trang hiện tại

  final List<String> _imagePaths = [
    'assets/images/images.jpg',
    'assets/images/images.jpg',
    'assets/images/images.jpg',
  ]; // Danh sách các ảnh

  @override
  void initState() {
    super.initState();
    _startTypingEffect(); // Bắt đầu hiệu ứng gõ chữ
    _startAutoSlide(); // Bắt đầu hiệu ứng tự động chuyển slide
    _pageController = PageController(initialPage: 0); // Khởi tạo PageController
  }

  @override
  void dispose() {
    _timer.cancel(); // Hủy Timer khi widget bị hủy
    _slideTimer.cancel(); // Hủy Timer cho slide
    _pageController.dispose(); // Hủy PageController
    super.dispose();
  }

  // Hàm bắt đầu hiệu ứng gõ chữ
  void _startTypingEffect() {
    _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      setState(() {
        if (_charIndex < _texts[_currentTextIndex].length) {
          // Thêm từng ký tự vào văn bản hiển thị
          _displayedText = _texts[_currentTextIndex].substring(0, _charIndex + 1);
          _charIndex++;
        } else {
          // Khi hoàn thành gõ chữ, đợi 1 giây rồi chuyển sang văn bản tiếp theo
          Future.delayed(const Duration(seconds: 1), () {
            setState(() {
              _currentTextIndex = (_currentTextIndex + 1) % _texts.length; // Chuyển đổi giữa các văn bản
              _displayedText = ''; // Reset văn bản hiển thị
              _charIndex = 0; // Reset chỉ số ký tự
            });
          });
        }
      });
    });
  }

  // Hàm bắt đầu hiệu ứng tự động chuyển slide
  void _startAutoSlide() {
    _slideTimer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (_currentPageIndex < _imagePaths.length - 1) {
        _currentPageIndex++; // Chuyển sang trang tiếp theo
      } else {
        _currentPageIndex = 0; // Quay lại trang đầu tiên
      }
      _pageController.animateToPage(
        _currentPageIndex,
        duration: const Duration(milliseconds: 500), // Thời gian chuyển trang
        curve: Curves.easeInOut, // Hiệu ứng chuyển trang
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.h,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Slide ảnh
          SizedBox(
            height: 150.h,
            child: PageView.builder(
              controller: _pageController, // Gắn PageController
              itemCount: _imagePaths.length, // Số lượng ảnh
              itemBuilder: (context, index) {
                return Image.asset(
                  _imagePaths[index],
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
          // Ô input tìm kiếm
          Positioned(
            left: 20.w,
            right: 20.w,
            bottom: 12.h,
            child: GestureDetector(
              onTap: () {
                print('Tapped with index: $_currentTextIndex'); // Debugging
                if (_currentTextIndex == 0) {
                  Navigator.pushNamed(context, '/search_foods');
                } else {
                  Navigator.pushNamed(context, '/search_location');
                }
              },
              child: Container(
                height: 50.h,
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30.r),
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
                    Icon(Icons.search, color: Colors.grey.shade600, size: 22.sp),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: Stack(
                        alignment: Alignment.centerLeft,
                        children: [
                          // Hiệu ứng gõ chữ
                          Positioned(
                            left: 0,
                            child: DefaultTextStyle(
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: Colors.grey.shade400,
                                fontWeight: FontWeight.w400,
                              ),
                              child: Row(
                                children: [
                                  const Text("Tìm "), // Chữ cố định
                                  Text(
                                    _displayedText, // Văn bản đang được gõ
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      color: Colors.grey.shade400,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // Ô nhập liệu (Bị vô hiệu hóa)
                          TextField(
                            enabled: false, // Vô hiệu hóa nhập liệu
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.zero,
                            ),
                            style: TextStyle(fontSize: 14.sp, color: Colors.black, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}