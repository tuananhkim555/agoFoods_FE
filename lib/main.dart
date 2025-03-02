import 'package:agofoods/constants/constants.dart';
import 'package:agofoods/views/entrypoint.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:agofoods/views/search/search_page.dart'; // Import SearchFoodsPage
import 'package:agofoods/views/search/search_location_page.dart'; // Import SearchLocationPage

Widget defaultHome = MainScreen();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Set the fit size (Find your UI design, look at the dimensions of the device screen and fill it in, unit in dp)
    return ScreenUtilInit(
      designSize: const Size(375, 825),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'AGO Foods',
          theme: ThemeData(
            useMaterial3: false,
            scaffoldBackgroundColor: kOffWhite,
            iconTheme: const IconThemeData(color: kDark),
            primarySwatch: Colors.grey,
          ),
          initialRoute: '/', // Route mặc định
          routes: {
            '/': (context) => defaultHome, // Trang mặc định
            '/search_foods': (context) => const SearchPage(), // Route cho tìm món ăn
            '/search_location': (context) => const SearchLocationPage(), // Route cho tìm địa điểm
          },
        );
      },
    );
  }
}