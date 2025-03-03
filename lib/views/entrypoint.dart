import 'package:agofoods/constants/constants.dart';
import 'package:agofoods/views/cart/cart_page.dart';
import 'package:agofoods/views/home/home_page.dart';
import 'package:agofoods/views/profile/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/tab_index_controller.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:agofoods/views/notifications/notifications.dart';
import 'package:agofoods/views/activate/activate.dart';

// ignore: must_be_immutable
class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final List<Widget> pageList = [
    const HomePage(),
    const ActivatePage(),
    const NotificationPage(),
    const CartPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TabIndexController());
    
    // ✅ Số lượng thông báo (Sau này có thể lấy từ API hoặc GetX)
    const int notificationCount = 1; // Ví dụ số lượng thông báo

    return Obx(() => Scaffold(
          body: IndexedStack(
            index: controller.tabIndex,
            children: pageList,
          ),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 5,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.white,
              selectedItemColor: kGrayDark,
              unselectedItemColor: Colors.grey,
              selectedFontSize: 11,
              unselectedFontSize: 11,
              selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w400),
              unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w300),
              onTap: (value) {
                controller.setTabIndex = value;
              },
              currentIndex: controller.tabIndex,
              items: [
                _buildNavItem(
                  iconActive: Boxicons.bxs_category,
                  iconInactive: Boxicons.bxs_category_alt,
                  label: "Trang chủ",
                  index: 0,
                  controller: controller,
                ),
                _buildNavItem(
                  iconActive: FontAwesomeIcons.truckFast,
                  iconInactive: FontAwesomeIcons.truck,
                  label: "Hoạt động",
                  index: 1,
                  controller: controller,
                ),
                _buildNotificationItem(controller, notificationCount), // ✅ Thêm badge số lượng
                _buildCartItem(controller),
                _buildNavItem(
                  iconActive: FontAwesomeIcons.userCircle,
                  iconInactive: FontAwesomeIcons.solidUserCircle,
                  label: "Cá nhân",
                  index: 4,
                  controller: controller,
                ),
              ],
            ),
          ),
        ));
  }

  /// ✅ Hàm tạo Item Thông báo với Badge Số Lượng
  BottomNavigationBarItem _buildNotificationItem(TabIndexController controller, int notificationCount) {
    return BottomNavigationBarItem(
      icon: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 10),
          Stack(
            clipBehavior: Clip.none,
            children: [
              Icon(
                controller.tabIndex == 2
                    ? FontAwesomeIcons.bell
                    : FontAwesomeIcons.solidBell,
                size: 20,
              ),
              if (notificationCount > 0) // ✅ Hiển thị nếu có thông báo
                Positioned(
                  right: -6,
                  top: -6,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      height: 16,
                      width: 16,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        '$notificationCount', // ✅ Số lượng thông báo
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 5),
          Text(
            'Thông báo',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w400,
              color: controller.tabIndex == 2 ? kGrayDark : Colors.grey,
            ),
          ),
        ],
      ),
      label: '',
    );
  }

  /// ✅ Hàm tạo Item Giỏ Hàng với Badge Số Lượng
  BottomNavigationBarItem _buildCartItem(TabIndexController controller) {
    const int cartItemCount = 1; // Giả lập số lượng sản phẩm trong giỏ

    return BottomNavigationBarItem(
      icon: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 10),
          Stack(
            clipBehavior: Clip.none,
            children: [
              const Icon(FontAwesomeIcons.cartShopping, size: 20),
              if (cartItemCount > 0) // ✅ Chỉ hiển thị khi có hàng
                Positioned(
                  right: -6,
                  top: -6,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      height: 16,
                      width: 16,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      child: const Text(
                        '$cartItemCount', // ✅ Số lượng giỏ hàng
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 5),
          Text(
            'Giỏ hàng',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w400,
              color: controller.tabIndex == 3 ? kGrayDark : Colors.grey,
            ),
          ),
        ],
      ),
      label: '',
    );
  }

  /// ✅ Hàm tạo Item Bottom Navigation Bar chung
  BottomNavigationBarItem _buildNavItem({
    required IconData iconActive,
    required IconData iconInactive,
    required String label,
    required int index,
    required TabIndexController controller,
  }) {
    return BottomNavigationBarItem(
      icon: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 10),
          Icon(
            controller.tabIndex == index ? iconActive : iconInactive,
            size: 20,
          ),
          const SizedBox(height: 5),
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w400,
              color: controller.tabIndex == index ? kGrayDark : Colors.grey,
            ),
          ),
        ],
      ),
      label: '',
    );
  }
}
