import 'package:flutter/material.dart';

class CarPage extends StatelessWidget {
  const CarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Danh mục Ô tô")),
      body: const Center(child: Text("Trang Ô tô - Fetch API ở đây")),
    );
  }
}
