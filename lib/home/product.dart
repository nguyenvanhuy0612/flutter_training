class Product {
  final String name;
  final String modelName;
  final double starRate;
  final int numberOfBought;
  final double price;
  final String brand;

  Product({
    required this.name,
    required this.modelName,
    required this.starRate,
    required this.numberOfBought,
    required this.price,
    required this.brand,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['Name'] as String? ?? '',
      modelName: json['Model Name'] as String? ?? '',
      starRate: (json['Star Rate'] as num?)?.toDouble() ?? 0.0,
      numberOfBought: (json['Number Bought'] as int?) ?? 0,
      price: (json['Price'] as num?)?.toDouble() ?? 0.0,
      brand: json['Brand'] as String? ?? '',
    );
  }
}
