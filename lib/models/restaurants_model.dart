import 'coords_model.dart';
class RestaurantsModel {
  final String id;
  final String title;
  final String imageUrl;
  final String userId;
  final String idCard;
  final String avatar;
  final String logoUrl;
  final double rating;
  final int ratingCount;
  final String description;
  final String category;
  final bool pickup;
  final bool delivery;
  final String time;
  final bool isActive;
  final String verification;
  final String verificationMessage;
  final bool isVerified;
  final bool isAvailable;
  final int reportCount;
  final bool isBanned;
  final String code;
  final Coords coords;

  RestaurantsModel({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.userId,
    required this.idCard,
    required this.avatar,
    required this.logoUrl,
    required this.rating,
    required this.ratingCount,
    required this.description,
    required this.category,
    required this.pickup,
    required this.delivery,
    required this.time,
    required this.isActive,
    required this.verification,
    required this.verificationMessage,
    required this.isVerified,
    required this.isAvailable,
    required this.reportCount,
    required this.isBanned,
    required this.code,
    required this.coords,
  });

  factory RestaurantsModel.fromJson(Map<String, dynamic> json) {
    return RestaurantsModel(
      id: json['id'] as String,
      title: json['title'] as String,
      imageUrl: json['imageUrl'] as String,
      userId: json['userId'] as String,
      idCard: json['idCard'] as String,
      avatar: json['avatar'] as String,
      logoUrl: json['logoUrl'] as String,
      rating: json['rating'] as double,
      ratingCount: json['ratingCount'] as int,
      description: json['description'] as String,
      category: json['category'] as String,
      pickup: json['pickup'] as bool,
      delivery: json['delivery'] as bool,
      time: json['time'] as String,
      isActive: json['isActive'] as bool,
      verification: json['verification'] as String,
      verificationMessage: json['verificationMessage'] as String,
      isVerified: json['isVerified'] as bool,
      isAvailable: json['isAvailable'] as bool,
      reportCount: json['reportCount'] as int,
      isBanned: json['isBanned'] as bool,
      code: json['code'] as String,
      coords: Coords.fromJson(json['coords']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'imageUrl': imageUrl,
      'userId': userId,
      'idCard': idCard,
      'avatar': avatar,
      'logoUrl': logoUrl,
      'rating': rating,
      'ratingCount': ratingCount,
      'description': description,
      'category': category,
      'pickup': pickup,
      'delivery': delivery,
      'time': time,
      'isActive': isActive,
      'verification': verification,
      'verificationMessage': verificationMessage,
      'isVerified': isVerified,
      'isAvailable': isAvailable,
      'reportCount': reportCount,
      'isBanned': isBanned,
      'code': code,
      'coords': coords.toJson(),
    };
  }
}