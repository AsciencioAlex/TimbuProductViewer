class Product {
  final String id;
  final String name;
  final String description;
  final String dateCreated;
  final int availableQuantity;
  final double currentPrice;
  final String status;
  final List<String> photos;
  final String brand;
  final String color;
  final String size;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.dateCreated,
    required this.availableQuantity,
    required this.currentPrice,
    required this.status,
    required this.photos,
    required this.brand,
    required this.color,
    required this.size,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['unique_id'] ?? '',
      name: json['name'] ?? '',
      description:
          json['description'] == 'null' ? '' : json['description'] ?? '',
      dateCreated: json['date_created'] ?? '',
      availableQuantity: (json['available_quantity'] ?? 0).toInt(),
      currentPrice: (json['current_price'] is List)
          ? json['current_price'][0]['KES'][0]
          : (json['current_price'] ?? 0).toDouble(),
      status: json['status'] ?? 'available',
      photos: (json['photos'] as List<dynamic>)
          .map((photo) => photo['url'] as String)
          .toList(),
      brand: json['brand'] ?? '',
      color: json['color'] ?? '',
      size: json['size'] ?? '',
    );
  }
}
