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
<<<<<<< HEAD
  bool isWishlisted; // Add this property
=======
>>>>>>> a80bc33580daa6dadef7209eed4a9e51b8bf95a0

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
<<<<<<< HEAD
    this.isWishlisted = false, // Initialize it
=======
>>>>>>> a80bc33580daa6dadef7209eed4a9e51b8bf95a0
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['unique_id'] ?? '',
      name: json['name'] ?? '',
      description:
          json['description'] == 'null' ? '' : json['description'] ?? '',
      dateCreated: json['date_created'] ?? '',
      availableQuantity: (json['available_quantity'] ?? 0).toInt(),
      currentPrice: _parseCurrentPrice(json['current_price']),
      status: json['status'] ?? 'available',
<<<<<<< HEAD
      photos: (json['photos'] as List<dynamic>?)
              ?.map((photo) => photo['url'] as String)
              .toList() ??
          [],
=======
      photos: (json['photos'] as List<dynamic>)
          .map((photo) => photo['url'] as String)
          .toList(),
>>>>>>> a80bc33580daa6dadef7209eed4a9e51b8bf95a0
      brand: json['brand'] ?? '',
      color: json['color'] ?? '',
      size: json['size'] ?? '',
    );
  }

  static double _parseCurrentPrice(dynamic currentPrice) {
    if (currentPrice is List && currentPrice.isNotEmpty) {
      var kesPrice = currentPrice[0]['KES'];
      if (kesPrice is List && kesPrice.isNotEmpty && kesPrice[0] is double) {
        return kesPrice[0];
      }
    }
    return 0.0;
  }
}
