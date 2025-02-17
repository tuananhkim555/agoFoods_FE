import 'dart:convert';

class Coords {
  final String id;
  final String title;
  final double latitude;
  final double longitude;
  final String address;
  final double latitudeDelta;
  final double longitudeDelta;

  Coords({
    required this.id,
    required this.title,
    required this.latitude,
    required this.longitude,
    required this.address,
    this.latitudeDelta = 0.0122,
    this.longitudeDelta = 0.0122,
  });

  // Chuyển từ JSON sang đối tượng Coords
  factory Coords.fromJson(Map<String, dynamic> json) {
    return Coords(
      id: json['id'] as String,
      title: json['title'] as String,
      latitude: json['latitude'] as double,
      longitude: json['longitude'] as double,
      address: json['address'] as String,
      latitudeDelta: json['latitudeDelta'] as double? ?? 0.0122,
      longitudeDelta: json['longitudeDelta'] as double? ?? 0.0122,
    );
  }

  // Chuyển từ đối tượng Coords sang JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'latitude': latitude,
      'longitude': longitude,
      'address': address,
      'latitudeDelta': latitudeDelta,
      'longitudeDelta': longitudeDelta,
    };
  }
}

// Hàm tiện ích để chuyển đổi danh sách JSON thành danh sách Coords
List<Coords> coordsModelFromJson(String str) =>
    List<Coords>.from(json.decode(str).map((x) => Coords.fromJson(x)));

// Hàm tiện ích để chuyển đổi danh sách Coords thành JSON
String coordsModelToJson(List<Coords> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));