import 'package:agofoods/models/additives_model.dart';
import 'package:agofoods/models/base_food_drink_model.dart';

class FoodsModel extends BaseFoodDrinkModel {
  List<FoodTypeModel> foodTypes;
  List<FoodTagModel> foodTags;
  List<AdditiveModel> additives;
  int? quantity;

  FoodsModel({
    required String id,
    required String restaurantId,
    required String title,
    required String time,
    required int price,
    String? description,
    required String categoryId,
    required String code,
    double? rating,
    int? ratingCount,
    List<String>? imageUrl,
    required bool isAvailable,
    required bool status,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.foodTypes = const [],
    this.foodTags = const [],
    this.additives = const [],
    this.quantity,
  }) : super(
      id: id,
      restaurantId: restaurantId,
      title: title,
      time: time,
      price: price,
      description: description,
      categoryId: categoryId,
      code: code,
      rating: rating,
      ratingCount: ratingCount,
      imageUrl: imageUrl,
      isAvailable: isAvailable,
      status: status,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );

  factory FoodsModel.fromJson(Map<String, dynamic> json) {
    return FoodsModel(
      id: json['id'] ?? '',
      restaurantId: json['restaurantId'] ?? '',
      title: json['title'] ?? '',
      time: json['time'] ?? '',
      price: json['price'] is num ? (json['price'] as num).toInt() : 0,
      description: json['description'],
      categoryId: json['categoryId'] ?? '',
      code: json['code'] ?? '',
      rating: json['rating'] is num ? (json['rating'] as num).toDouble() : null,
      ratingCount: json['ratingCount'] as int?,
      imageUrl: (json['imageUrl'] as List<dynamic>?)?.map((e) => e.toString()).toList(),
      isAvailable: json['isAvailable'] == true,
      status: json['status'] == true,
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      foodTypes: (json['foodTypes'] as List<dynamic>?)?.map((e) => FoodTypeModel.fromJson(e)).toList() ?? [],
      foodTags: (json['foodTags'] as List<dynamic>?)?.map((e) => FoodTagModel.fromJson(e)).toList() ?? [],
      additives: (json['additives'] as List<dynamic>?)?.map((e) => AdditiveModel.fromJson(e)).toList() ?? [],
      quantity: json['quantity'] as int?,
    );
  }
}


class FoodTagModel {
  final String id;
  final String name;
  final DateTime createdAt;
  final DateTime updatedAt;

  FoodTagModel({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });

  factory FoodTagModel.fromJson(Map<String, dynamic> json) {
    return FoodTagModel(
      id: json['id'],
      name: json['name'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}

class FoodTypeModel {
  final String id;
  final String name;
  final DateTime createdAt;
  final DateTime updatedAt;

  FoodTypeModel({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });

  factory FoodTypeModel.fromJson(Map<String, dynamic> json) {
    return FoodTypeModel(
      id: json['id'],
      name: json['name'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}

