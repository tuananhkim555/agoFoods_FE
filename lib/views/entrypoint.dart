import 'package:agofoods/constants/constants.dart';
import 'package:agofoods/views/cart/cart_page.dart';
import 'package:agofoods/views/home/home_page.dart';
import 'package:agofoods/views/profile/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/tab_index_controller.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:agofoods/views/addFoods/add_foods.dart';
import 'package:agofoods/views/management/management.dart';

// ignore: must_be_immutable
 class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final List<Widget> pageList = [
    const HomePage(),
    const ManagementPage(),
    const AddFoodPage(),
    const CartPage(), 
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TabIndexController());

    return Obx(() => Scaffold(
          body: IndexedStack(
            index: controller.tabIndex,
            children: pageList,
          ),
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(canvasColor: kPrimary),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              unselectedIconTheme: const IconThemeData(
                color: Color.fromARGB(173, 255, 255, 255),
              ),
              selectedIconTheme: const IconThemeData(color: kWhite),
              onTap: (value) {
                controller.setTabIndex = value;
              },
              currentIndex: controller.tabIndex,
              items: [
                BottomNavigationBarItem(
                  icon: controller.tabIndex == 0
                      ? const Icon(Boxicons.bxs_category)
                      : const Icon(Boxicons.bxs_category_alt),
                  label: 'Home',
                ),
                const BottomNavigationBarItem(
                  icon: Icon(FontAwesomeIcons.folderOpen),
                  label: 'Quản lý tin',
                ),
                BottomNavigationBarItem(
                  icon: controller.tabIndex == 2
                      ? const Icon(FontAwesomeIcons.edit)
                      : const Icon(FontAwesomeIcons.solidEdit),
                  label: 'Đăng món ăn',
              ),
                BottomNavigationBarItem(
                  icon: Badge(
                    label: const Text('1'),
                    child: Icon(
                      controller.tabIndex == 3
                          ? FontAwesomeIcons.cartShopping
                          : FontAwesomeIcons.cartShopping,
                    ),
                  ),
                  label: 'Giỏ hàng',
                ),
                BottomNavigationBarItem(
                  icon: controller.tabIndex == 4
                      ? const Icon(FontAwesomeIcons.userCircle)
                      : const Icon(FontAwesomeIcons.solidUserCircle),
                  label: 'Cá nhân',
                ),
              ],
            ),
          ),
        ));
  }
}
