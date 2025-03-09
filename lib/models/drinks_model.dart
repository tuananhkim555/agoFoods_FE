import 'package:agofoods/models/additives_model.dart';
import 'package:agofoods/models/base_food_drink_model.dart';

class DrinksModel extends BaseFoodDrinkModel {
  List<DrinkTypeModel> drinkTypes;
  List<DrinkTagModel> drinkTags;
  List<AdditiveModel> additives;
  int? quantity;

  DrinksModel({
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
    this.drinkTypes = const [],
    this.drinkTags = const [],
    this.additives = const [],
    this.quantity, required value,
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

  factory DrinksModel.fromJson(Map<String, dynamic> json) {
    return DrinksModel(
      id: json['id'] ?? '',
      restaurantId: json['restaurantId'] ?? '',
      title: json['title'] ?? '',
      time: json['time'] ?? '',
      value: json['value'],
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
      drinkTypes: (json['drinkTypes'] as List<dynamic>?)?.map((e) => DrinkTypeModel.fromJson(e)).toList() ?? [],
      drinkTags: (json['drinkTags'] as List<dynamic>?)?.map((e) => DrinkTagModel.fromJson(e)).toList() ?? [],
      additives: (json['additives'] as List<dynamic>?)?.map((e) => AdditiveModel.fromJson(e)).toList() ?? [],
      quantity: json['quantity'] as int?,
    );
  }

}


class DrinkTagModel {
  final String id;
  final String name;
  final DateTime createdAt;
  final DateTime updatedAt;

  DrinkTagModel({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });

  factory DrinkTagModel.fromJson(Map<String, dynamic> json) {
    return DrinkTagModel(
      id: json['id'] ?? '',
      name: json['name'] ?? 'Không có tên',
      createdAt: DateTime.tryParse(json['createdAt'] ?? '') ?? DateTime.now(),
      updatedAt: DateTime.tryParse(json['updatedAt'] ?? '') ?? DateTime.now(),
    );
  }

}

class DrinkTypeModel {
  final String id;
  final String name;
  final DateTime createdAt;
  final DateTime updatedAt;

  DrinkTypeModel({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });

  factory DrinkTypeModel.fromJson(Map<String, dynamic> json) {
    return DrinkTypeModel(
      id: json['id'] ?? '',
      name: json['name'] ?? 'Không có tên',
      createdAt: DateTime.tryParse(json['createdAt'] ?? '') ?? DateTime.now(),
      updatedAt: DateTime.tryParse(json['updatedAt'] ?? '') ?? DateTime.now(),
    );
  }
}


