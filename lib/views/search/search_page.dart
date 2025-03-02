import 'package:agofoods/common/custom_container.dart';
import 'package:agofoods/common/shimmers/foodlist_shimmer.dart';
import 'package:agofoods/controllers/search_controller.dart';
import 'package:agofoods/views/search/loading_widget.dart';
import 'package:agofoods/views/search/search_results.dart';
import 'package:flutter/material.dart';
import "package:flutter_screenutil/flutter_screenutil.dart";
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  final controller = Get.put(SearchFoodsDrinksController());
  bool _hasSearched = false; // Chỉ đổi icon sau khi tìm kiếm

  @override
  void initState() {
    super.initState();

    // Lắng nghe thay đổi của input để cập nhật UI nếu bị xóa
    _searchController.addListener(() {
      if (_searchController.text.isEmpty) {
        setState(() {
          _hasSearched = false; // Khi input trống, đổi icon về search
        });
      }
    });
  }

  void _performSearch() {
    String query = _searchController.text.trim();
    if (query.isNotEmpty) {
      controller.searchFoodsDrinks(query);
      setState(() {
        _hasSearched = true; // Chỉ đổi icon sau khi tìm kiếm
      });
    } else {
      _clearSearch();
    }
  }

  void _clearSearch() {
    _searchController.clear();
    controller.searchResults.clear();
    setState(() {
      _hasSearched = false; // Reset icon về search
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [
              // AppBar Gradient
              Stack(
                children: [
                  Container(
                    height: 140.h,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.orange, Colors.red],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 55.h,
                    left: 16.w,
                    right: 16.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () => Get.back(),
                              child: Icon(
                                Ionicons.arrow_back,
                                size: 28.h,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 12.w),
                            Icon(
                              Ionicons.location_outline,
                              size: 20.h,
                              color: Colors.white,
                            ),
                            SizedBox(width: 8.w),
                            Text(
                              "Giao tới",
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5.h),
                        Row(
                          children: [
                            SizedBox(width: 40.w),
                            Text(
                              "Kiến Giang",
                              style: TextStyle(
                                  fontSize: 12.sp, color: Colors.white),
                            ),
                            SizedBox(width: 5.w),
                            Icon(
                              Ionicons.chevron_down,
                              size: 18.h,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              // Ô tìm kiếm
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Container(
                  transform: Matrix4.translationValues(0, -20.h, 0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 6,
                        offset: const Offset(0, 3),
                      )
                    ],
                  ),
                  child: TextField(
                    controller: _searchController,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.search,
                    onSubmitted: (_) => _performSearch(),
                    decoration: InputDecoration(
                      hintText: "Bạn đang thèm gì?",
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 14.sp),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          _hasSearched ? _clearSearch() : _performSearch();
                        },
                        child: Icon(
                          _hasSearched ? Ionicons.close : Ionicons.search,
                          size: 26.h,
                          color: _hasSearched ? Colors.red : Colors.grey,
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 14.h, horizontal: 12.w),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ),

              // Nội dung API trả về
              Expanded(
                child: CustomContainer(
                  color: Colors.white,
                  containerContent: controller.isLoading
                      ? const FoodListShimmer()
                      : (controller.searchResults.isEmpty)
                          ? const LoadingWidget()
                          : const SearchResults(),
                ),
              ),
            ],
          ),
        ));
  }
}
