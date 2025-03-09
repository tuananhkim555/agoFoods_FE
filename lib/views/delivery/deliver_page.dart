import 'package:flutter/material.dart';

class DeliveryPage extends StatelessWidget {
  const DeliveryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Danh mục Giao hàng")),
      body: const Center(child: Text("Trang Giao hàng - Fetch API ở đây")),
    );
  }
}
