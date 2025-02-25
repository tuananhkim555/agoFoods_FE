// File: search_foods_page.dart
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchFoodsPage extends StatelessWidget {
  const SearchFoodsPage({super.key});

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: PreferredSize(
  preferredSize: const Size.fromHeight(50), // Set chiều cao cho AppBar
  child: AppBar(
    leading: IconButton(
      icon: const Icon(Icons.arrow_back, color: Colors.black),
      onPressed: () => Navigator.pop(context),
    ),
    elevation: 0,
    backgroundColor: Colors.transparent,
    titleSpacing: 0, // Loại bỏ khoảng cách mặc định
    title: _buildAddressSection(), // Gọi widget địa chỉ
  ),
),

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSearchInput(),
            const SizedBox(height: 24),
            _buildTrendingIcons(),
            const SizedBox(height: 24),
            _buildRecentFoods(),
          ],
        ),
      ),
    );
  }

 // Phần địa chỉ
Widget _buildAddressSection() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start, // Dịch toàn bộ nội dung sang phải
    children: [
      const Icon(Icons.location_on, color: Colors.red, size: 20),
      const SizedBox(),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Địa chỉ của bạn",
            style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
          ),
          const Row(
            mainAxisSize: MainAxisSize.min, // Giảm kích thước của Row
            children: [
              Text(
                "Kiến Giang",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              const SizedBox(width: 4),
              const Icon(Icons.keyboard_arrow_down, size: 18, color: Colors.black),
            ],
          ),
        ],
      ),
    ],
  );
}
  // Ô input tìm kiếm
  Widget _buildSearchInput() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            offset: const Offset(0, 4),
            blurRadius: 8,
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Tìm món ăn đồ uống...",
          hintStyle: TextStyle(fontSize: 14, color: Colors.grey.shade600),
          prefixIcon: const Icon(Icons.search, color: Colors.grey, size: 20),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
        ),
      ),
    );
  }

  // Các icon xu hướng món ăn nổi bật
  Widget _buildTrendingIcons() {
    final List<Map<String, dynamic>> trendingItems = [
      {"icon": Icons.fastfood, "label": "Burger"},
      {"icon": Icons.local_pizza, "label": "Pizza"},
      {"icon": FontAwesomeIcons.utensils, "label": "Sushi"},
      {"icon": FontAwesomeIcons.mugHot, "label": "Coffee"},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       const Text(
          "Xu hướng món ăn",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: trendingItems.map((item) {
            return Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        offset: const Offset(0, 2),
                        blurRadius: 4,
                      ),
                    ],
                  ),
                  child: Icon(
                    item["icon"],
                    size: 24,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  item["label"]!,
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ],
            );
          }).toList(),
        ),
      ],
    );
  }

  // Danh sách các món ăn gần đây
  Widget _buildRecentFoods() {
    final List<Map<String, dynamic>> recentFoods = [
      {"name": "Burger King", "icon": Icons.fastfood},
      {"name": "Pizza Hut", "icon": Icons.local_pizza},
      {"name": "Sushi Bar", "icon": FontAwesomeIcons.utensils},
      {"name": "Starbucks Coffee", "icon": FontAwesomeIcons.mugHot},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Gần đây",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: recentFoods.length,
          separatorBuilder: (context, index) => Divider(thickness: 0.5, color: Colors.grey.shade300),
          itemBuilder: (context, index) {
            final food = recentFoods[index];
            return ListTile(
              contentPadding: EdgeInsets.zero,
              leading: CircleAvatar(
                radius: 20,
                backgroundColor: Colors.grey[200],
                child: Icon(
                  food["icon"] as IconData,
                  size: 18,
                  color: Colors.black,
                ),
              ),
              title: Text(
                food["name"],
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
            );
          },
        ),
      ],
    );
  }
}