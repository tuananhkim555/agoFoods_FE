abstract class BaseFoodDrinkModel {
  String id;
  String restaurantId;
  String title;
  String time;
  int price;
  String? description;
  String categoryId;
  String code;
  double? rating;
  int? ratingCount;
  List<String>? imageUrl;
  bool isAvailable;
  bool status;
  DateTime createdAt;
  DateTime updatedAt;

  BaseFoodDrinkModel({
    required this.id,
    required this.restaurantId,
    required this.title,
    required this.time,
    required this.price,
    this.description,
    required this.categoryId,
    required this.code,
    this.rating,
    this.ratingCount,
    this.imageUrl,
    required this.isAvailable,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });
}
