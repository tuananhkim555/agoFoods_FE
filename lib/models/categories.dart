import 'dart:convert';

// Hàm chuyển đổi JSON sang List<CategoryModel>
List<CategoriesModel> categoriesModelFromJson(String str) =>
    List<CategoriesModel>.from(
        json.decode(str).map((x) => CategoriesModel.fromJson(x)));

// Hàm chuyển đổi List<CategoryModel> sang JSON
String categoriesModelToJson(List<CategoriesModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CategoriesModel {
  String? id;
  String? title;
  String? value;
  String? image;
  String? type;
  final String imageUrl;
  final int version;
  final DateTime createdAt;
  final DateTime updatedAt;

  // Định nghĩa các constant cho type
  static const String TYPE_FOOD = "FOOD";
  static const String TYPE_DRINK = "DRINK";

  // Constructor
  CategoriesModel({
    this.id,
    this.title,
    this.value,
    this.image,
    this.type,
    required this.imageUrl,
    required this.version,
    required this.createdAt,
    required this.updatedAt,
  });

  // Factory constructor để ánh xạ từ JSON
  factory CategoriesModel.fromJson(Map<String, dynamic> json) {
    return CategoriesModel(
      id: json['id'],
      title: json['title'],
      value: json['value'],
      image: json['image'],
      type: json['type'],
      imageUrl: json['imageUrl'],
      version: json['version'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  // Phương thức toJson để chuyển đổi đối tượng thành JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['value'] = value;
    data['image'] = image;
    data['type'] = type;
    data['imageUrl'] = imageUrl;
    data['version'] = version;
    data['createdAt'] = createdAt.toIso8601String();
    data['updatedAt'] = updatedAt.toIso8601String();
    return data;
  }
}
