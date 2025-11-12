class ProductModel {
  final int id;
  final String name;
  final String description;
  final double price;
  final int stars;
  final String img;
  final String location;

  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.stars,
    required this.img,
    this.location = '',
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] as int,
      name: (json['name'] ?? '') as String,
      description: (json['description'] ?? '') as String,
      price: (json['price'] is int) ? (json['price'] as int).toDouble() : (json['price'] ?? 0.0) as double,
      stars: (json['stars'] ?? 0) as int,
      img: (json['img'] ?? '') as String,
      location: (json['location'] ?? '') as String,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'price': price,
        'stars': stars,
        'img': img,
        'location': location,
      };
}
