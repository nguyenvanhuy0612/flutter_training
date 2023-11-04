class Product {
  final String name;
  final String modelName;
  final double starRate;
  final int numberOfBought;
  final double price;
  final String brand;
  String? imageUrl;

  Product({
    required this.name,
    required this.modelName,
    required this.starRate,
    required this.numberOfBought,
    required this.price,
    required this.brand,
    this.imageUrl,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        name: json['Name'] as String? ?? '',
        modelName: json['Model Name'] as String? ?? '',
        starRate: (json['Star Rate'] as num?)?.toDouble() ?? 0.0,
        numberOfBought: (json['Number Bought'] as int?) ?? 0,
        price: (json['Price'] as num?)?.toDouble() ?? 0.0,
        brand: json['Brand'] as String? ?? '',
        imageUrl: json['Image Url'] as String?);
  }

  @override
  String toString() {
    return 'Product{name: $name}';
  }
}
