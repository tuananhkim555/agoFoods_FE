// File: image_slider.dart
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ImageSlider extends StatelessWidget {
  final List<String> imagePaths;

  const ImageSlider({
    super.key,
    required this.imagePaths,
  });

  @override
  Widget build(BuildContext context) {
    if (imagePaths.isEmpty) {
      return const Center(child: Text('Không có ảnh để hiển thị'));
    }

    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: true,
        enlargeCenterPage: false, // Không phóng to ảnh ở trung tâm
        viewportFraction: 1.0, // Đảm bảo ảnh chiếm toàn bộ chiều rộng
        aspectRatio: 16 / 9, // Tỷ lệ khung hình phù hợp
        autoPlayInterval: const Duration(seconds: 5),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
      ),
      items: imagePaths.map((path) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: double.infinity, // Chiếm toàn bộ chiều rộng
              margin: const EdgeInsets.symmetric(horizontal: 0.0), // Loại bỏ khoảng cách
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(path),
                  fit: BoxFit.cover, // Đảm bảo ảnh phủ toàn bộ không gian
                  onError: (exception, stackTrace) {
                    return 
                     print('Không thể tải ảnh: $path');
                  },
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}