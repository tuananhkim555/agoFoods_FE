import 'package:agofoods/constants/constants.dart';
import 'package:agofoods/views/notifications/notifications_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  int selectedIndex = 0;

  final List<Map<String, dynamic>> menuItems = [
    {"icon": FontAwesomeIcons.solidEnvelope, "label": "Tin nhắn"},
    {"icon": FontAwesomeIcons.solidBell, "label": "Thông báo"},
  ];

  // Danh sách tin nhắn & thông báo (Có thể cập nhật từ API)
  List<String> messages = []; // Danh sách tin nhắn (rỗng ban đầu)
  List<String> notifications = []; // Danh sách thông báo (rỗng ban đầu)

  @override
  Widget build(BuildContext context) {
    bool isMessageTab = selectedIndex == 0;
    List<String> currentList = isMessageTab ? messages : notifications;

    return Scaffold(
      backgroundColor: kOffWhite,
      appBar: AppBar(
        title: const Text(
          "Thông báo",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Thanh menu
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  bottom: BorderSide(color: Colors.grey[300]!, width: 1),
                ),
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
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              Icon(
                                menuItems[index]["icon"],
                                size: 16,
                                color: isActive ? kPrimary : Colors.grey[500],
                              ),
                              const SizedBox(width: 8),
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
                            width: isActive ? 70 : 0,
                            decoration: BoxDecoration(
                              color: kPrimary,
                              borderRadius: BorderRadius.circular(1),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
            const SizedBox(height: 10),

            // Nội dung chính
            Expanded(
              child: currentList.isEmpty
                  ? NotificationsWidget(
                      title: isMessageTab ? "Không có tin nhắn" : "Không có thông báo nào",
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: currentList.length,
                      itemBuilder: (context, index) {
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          child: ListTile(
                            title: Text(currentList[index]),
                            leading: Icon(
                              isMessageTab ? FontAwesomeIcons.solidEnvelope : FontAwesomeIcons.solidBell,
                              color: kPrimary,
                            ),
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
