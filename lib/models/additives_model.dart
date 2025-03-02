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
