import 'package:meta/meta.dart';
import 'dart:convert';

// Hàm chuyển đổi JSON sang List<CategoryModel>
List<CategoriesModel> categoriesModelFromJson(String str) =>
    List<CategoriesModel>.from(
        json.decode(str).map((x) => CategoriesModel.fromJson(x)));

// Hàm chuyển đổi List<CategoryModel> sang JSON
String categoriesModelToJson(List<CategoriesModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CategoriesModel {
  final String id;
  final String title;
  final String value;
  final String type;
  final String imageUrl;
  final int version;
  final DateTime createdAt;
  final DateTime updatedAt;

  // Constructor
  CategoriesModel({
    required this.id,
    required this.title,
    required this.value,
    required this.type,
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
      imageUrl: json['imageUrl'],
      type: json['type'],
      version: json['version'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  // Phương thức toJson để chuyển đổi đối tượng thành JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'value': value,
      'type': type,
      'imageUrl': imageUrl,
      'version': version,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}
