import 'dart:convert';

class Food {
  final String id;
  final String restaurantId;
  final String title;
  final String time;
  final double price;
  final String? description;
  final String categoryId;
  final List<String> foodTypes;
  final List<String> foodTags;
  final List<dynamic> additives; // Có thể cần ánh xạ thêm nếu có model Additives
  final String code;
  final double rating;
  final int ratingCount;
  final List<String> imageUrl;
  final bool isAvailable;
  final int quantity;
  final bool status;
  final DateTime createdAt;
  final DateTime updatedAt;

  Food({
    required this.id,
    required this.restaurantId,
    required this.title,
    required this.time,
    required this.price,
    this.description,
    required this.categoryId,
    required this.foodTypes,
    required this.foodTags,
    required this.additives,
    required this.code,
    required this.rating,
    required this.ratingCount,
    required this.imageUrl,
    required this.isAvailable,
    required this.quantity,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Food.fromJson(Map<String, dynamic> json) {
    return Food(
      id: json['id'] as String,
      restaurantId: json['restaurantId'] as String,
      title: json['title'] as String,
      time: json['time'] as String,
      price: json['price'] as double,
      description: json['description'] as String?,
      categoryId: json['categoryId'] as String,
      foodTypes: List<String>.from(json['foodTypes']),
      foodTags: List<String>.from(json['foodTags']),
      additives: json['additives'] as List<dynamic>,
      code: json['code'] as String,
      rating: json['rating'] as double,
      ratingCount: json['ratingCount'] as int,
      imageUrl: List<String>.from(json['imageUrl']),
      isAvailable: json['isAvailable'] as bool,
      quantity: json['quantity'] as int,
      status: json['status'] as bool,
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'restaurantId': restaurantId,
      'title': title,
      'time': time,
      'price': price,
      'description': description,
      'categoryId': categoryId,
      'foodTypes': foodTypes,
      'foodTags': foodTags,
      'additives': additives,
      'code': code,
      'rating': rating,
      'ratingCount': ratingCount,
      'imageUrl': imageUrl,
      'isAvailable': isAvailable,
      'quantity': quantity,
      'status': status,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}

// Hàm tiện ích để chuyển đổi danh sách JSON thành danh sách Food
List<Food> foodsModelFromJson(String str) =>
    List<Food>.from(json.decode(str).map((x) => Food.fromJson(x)));

// Hàm tiện ích để chuyển đổi danh sách Food thành JSON
String foodsModelToJson(List<Food> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));