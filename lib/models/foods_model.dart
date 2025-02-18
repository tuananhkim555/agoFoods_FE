class FoodsModel {
  final String id;
  final String restaurantId;
  final String title;
  final String time;
  final double price;
  final String? description;
  final String categoryId;
  final List<FoodTypeModel> foodTypes;
  final List<FoodTagModel> foodTags;
  final List<AdditiveModel> additives;
  final String code;
  final double rating;
  final int ratingCount;
  final List<String> imageUrl;
  final bool isAvailable;
  final int quantity;
  final bool status;
  final DateTime createdAt;
  final DateTime updatedAt;

  FoodsModel({
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

  factory FoodsModel.fromJson(Map<String, dynamic> json) {
    return FoodsModel(
      id: json['id'],
      restaurantId: json['restaurantId'],
      title: json['title'],
      time: json['time'],
      price: (json['price'] as num).toDouble(),
      description: json['description'],
      categoryId: json['categoryId'],
      foodTypes: (json['foodTypes'] as List)
          .map((item) => FoodTypeModel.fromJson(item))
          .toList(),
      foodTags: (json['foodTags'] as List)
          .map((item) => FoodTagModel.fromJson(item))
          .toList(),
      additives: (json['additives'] as List)
          .map((item) => AdditiveModel.fromJson(item))
          .toList(),
      code: json['code'],
      rating: (json['rating'] as num).toDouble(),
      ratingCount: json['ratingCount'],
      imageUrl: (json['imageUrl'] as List).cast<String>(),
      isAvailable: json['isAvailable'],
      quantity: json['quantity'],
      status: json['status'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
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

class AdditiveModel {
  final String id;
  final String title;
  final double price;
  final DateTime createdAt;
  final DateTime updatedAt;

  AdditiveModel({
    required this.id,
    required this.title,
    required this.price,
    required this.createdAt,
    required this.updatedAt,
  });

  factory AdditiveModel.fromJson(Map<String, dynamic> json) {
    return AdditiveModel(
      id: json['id'],
      title: json['title'],
      price: (json['price'] as num).toDouble(),
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}