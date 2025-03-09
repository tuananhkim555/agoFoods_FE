import 'package:flutter/material.dart';

class MotorbikePage extends StatelessWidget {
  const MotorbikePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Danh mục Xe máy")),
      body: const Center(child: Text("Trang Xe máy - Fetch API ở đây")),
    );
  }
}
