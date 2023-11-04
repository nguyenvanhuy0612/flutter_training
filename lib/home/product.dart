class Product {
  late String name;
  late int milesPerGallon;
  late int cylinders;
  late int displacement;
  late int horsepower;
  late int weightInLbs;
  late double acceleration;
  late DateTime year;
  late String origin;

  Product({
    required this.name,
    required this.milesPerGallon,
    required this.cylinders,
    required this.displacement,
    required this.horsepower,
    required this.weightInLbs,
    required this.acceleration,
    required this.year,
    required this.origin,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['Name'] as String? ?? '',
      milesPerGallon: (json['Miles_per_Gallon'] as num?)?.toInt() ?? 0,
      cylinders: (json['Cylinders'] as int?) ?? 0,
      displacement: (json['Displacement'] as num?)?.toInt() ?? 0,
      horsepower: (json['Horsepower'] as int?) ?? 0,
      weightInLbs: (json['Weight_in_lbs'] as int?) ?? 0,
      acceleration: (json['Acceleration'] as num?)?.toDouble() ?? 0.0,
      year: DateTime.tryParse(json['Year'] as String? ?? '') ?? DateTime.now(),
      origin: json['Origin'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Name': name,
      'Miles_per_Gallon': milesPerGallon,
      'Cylinders': cylinders,
      'Displacement': displacement,
      'Horsepower': horsepower,
      'Weight_in_lbs': weightInLbs,
      'Acceleration': acceleration,
      'Year': year.toIso8601String(),
      'Origin': origin,
    };
  }

  @override
  String toString() {
    return 'Product{name: $name, milesPerGallon: $milesPerGallon, '
        'cylinders: $cylinders, displacement: $displacement, '
        'horsepower: $horsepower, weightInLbs: $weightInLbs, '
        'acceleration: $acceleration, year: $year, origin: $origin}';
  }
}
