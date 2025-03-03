import 'package:agofoods/views/activate/activate_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:agofoods/constants/constants.dart';

class ActivatePage extends StatefulWidget {
  const ActivatePage({super.key});

  @override
  _ActivatePageState createState() => _ActivatePageState();
}

class _ActivatePageState extends State<ActivatePage> {
  int selectedIndex = 0;

  final List<Map<String, dynamic>> menuItems = [
    {"icon": FontAwesomeIcons.utensils, "label": "Đồ ăn/uống"},
    {"icon": FontAwesomeIcons.car, "label": "Chuyến xe"},
    {"icon": FontAwesomeIcons.truck, "label": "Giao hàng"},
  ];

  final Map<int, List<String>> activityData = {
    0: [], // Đồ ăn/uống
    1: [], // Chuyến xe
    2: [], // Giao hàng
  };

  @override
  Widget build(BuildContext context) {
    List<String> activities = activityData[selectedIndex] ?? [];

    return Scaffold(
      backgroundColor: kOffWhite,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Hoạt động gần đây",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            Icon(FontAwesomeIcons.clock, size: 20, color: Colors.grey[700]),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(bottom: BorderSide(color: Colors.grey[300]!, width: 1)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(menuItems.length, (index) {
                  bool isActive = selectedIndex == index;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(menuItems[index]["icon"], size: 16, color: isActive ? kPrimary : Colors.grey[500]),
                            const SizedBox(width: 6),
                            Text(
                              menuItems[index]["label"],
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
                                color: isActive ? kPrimary : Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          height: 2,
                          width: isActive ? 80 : 0,
                          decoration: BoxDecoration(color: kPrimary, borderRadius: BorderRadius.circular(1)),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: activities.isEmpty
                  ? ActivateWidget(title: "Không có ${menuItems[selectedIndex]['label'].toLowerCase()} nào")
                  : ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: activities.length,
                      itemBuilder: (context, index) {
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          child: ListTile(
                            title: Text(activities[index]),
                            leading: Icon(menuItems[selectedIndex]["icon"], color: kPrimary),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
