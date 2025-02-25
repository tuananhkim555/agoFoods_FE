// File: search_location_page.dart
import 'package:agofoods/constants/constants.dart';
import 'package:flutter/material.dart';

class SearchLocationPage extends StatelessWidget {
  const SearchLocationPage({super.key});
  

  @override
  Widget build(BuildContext context) {
    print('SearchLocationPage loaded'); // Debugging
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50), // Set chiều cao cho AppBar
        child: _buildCustomAppBar(context),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSearchInput(),
            const SizedBox(height: 24),
            _buildRecentLocations(),
          ],
        ),
      ),
    );
  }

  // Custom AppBar với phần địa chỉ
  Widget _buildCustomAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.black),
        onPressed: () => Navigator.pop(context),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      titleSpacing: 0, // Loại bỏ khoảng cách mặc định
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: _buildAddressSection(), // Gọi widget địa chỉ
      ),
    );
  }

  // Phần địa chỉ và icon dropdown
  Widget _buildAddressSection() {
    return Row(
      children: [
        const Icon(Icons.location_on, color: Colors.red, size: 20),
        const SizedBox(),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Địa chỉ của bạn",
                style: TextStyle(fontSize: 10, color: Colors.grey.shade600),
              ),
              const Row(
                children: [
                  Text(
                    "Kiến Giang",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),
                  ),
                  const SizedBox(width: 4),
                  const Icon(Icons.keyboard_arrow_down, size: 16, color: Colors.black),
                ],
              ),
            ],
          ),
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
          hintText: "Nhập địa điểm...",
          hintStyle: TextStyle(fontSize: 14, color: Colors.grey.shade600),
          prefixIcon: const Icon(Icons.search, color: Colors.grey, size: 20),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
        ),
      ),
    );
  }

  // Danh sách các địa điểm gần đây
  Widget _buildRecentLocations() {
    final List<Map<String, dynamic>> recentLocations = [
      {"name": "Cầu Rồng, Đà Nẵng", "icon": Icons.location_on},
      {"name": "Hồ Gươm, Hà Nội", "icon": Icons.location_on},
      {"name": "Chợ Bến Thành, TP.HCM", "icon": Icons.location_on},
      {"name": "Phố cổ Hội An", "icon": Icons.location_on},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Gần đây",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        const SizedBox(height: 12),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: recentLocations.length,
          separatorBuilder: (context, index) => Divider(thickness: 0.5, color: Colors.grey.shade300),
          itemBuilder: (context, index) {
            final location = recentLocations[index];
            return ListTile(
              contentPadding: EdgeInsets.zero,
              leading: CircleAvatar(
                radius: 20,
                backgroundColor: kSecondaryLight,
                child: Icon(
                  location["icon"] as IconData,
                  size: 18,
                  color: Colors.white,
                ),
              ),
              title: Text(
                location["name"],
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
            );
          },
        ),
      ],
    );
  }
}