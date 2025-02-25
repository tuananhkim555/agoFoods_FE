class DrinksModel {
  final String id;
  final String restaurantId;
  final String title;
  final String time;
  final double price;
  final String? description;
  final String categoryId;
  final List<DrinkTypeModel> drinkTypes;
  final List<DrinkTagModel> drinkTags;
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

  DrinksModel({
    required this.id,
    required this.restaurantId,
    required this.title,
    required this.time,
    required this.price,
    this.description,
    required this.categoryId,
    required this.drinkTypes,
    required this.drinkTags,
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

  factory DrinksModel.fromJson(Map<String, dynamic> json) {
    return DrinksModel(
      id: json['id'] ?? '',
      restaurantId: json['restaurantId'] ?? '',
      title: json['title'] ?? 'Không có tiêu đề',
      time: json['time'] ?? 'N/A',
      price: (json['price'] as num?)?.toDouble() ?? 0.0, // Nếu null -> 0.0
      description: json['description'],
      categoryId: json['categoryId'] ?? '',
      drinkTypes: (json['drinkTypes'] as List?)
              ?.map((item) => DrinkTypeModel.fromJson(item))
              .toList() ??
          [], // Nếu null -> danh sách rỗng
      drinkTags: (json['drinkTags'] as List?)
              ?.map((item) => DrinkTagModel.fromJson(item))
              .toList() ??
          [],
      additives: (json['additives'] as List?)
              ?.map((item) => AdditiveModel.fromJson(item))
              .toList() ??
          [],
      code: json['code'] ?? '',
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      ratingCount: (json['ratingCount'] as num?)?.toInt() ?? 0,
      imageUrl: (json['imageUrl'] as List?)?.cast<String>() ?? [],
      isAvailable: json['isAvailable'] ?? false,
      quantity: (json['quantity'] as num?)?.toInt() ?? 0,
      status: json['status'] ?? false,
      createdAt: DateTime.tryParse(json['createdAt'] ?? '') ?? DateTime.now(),
      updatedAt: DateTime.tryParse(json['updatedAt'] ?? '') ?? DateTime.now(),
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
      id: json['id'] ?? '',
      title: json['title'] ?? 'Không có tiêu đề',
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      createdAt: DateTime.tryParse(json['createdAt'] ?? '') ?? DateTime.now(),
      updatedAt: DateTime.tryParse(json['updatedAt'] ?? '') ?? DateTime.now(),
    );
  }
}
