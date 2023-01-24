class ProductsApiModel {
  int id;
  String title;
  double price;
  String description;
  String image;
  int likes;

  ProductsApiModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.image,
    required this.likes,
  });

  factory ProductsApiModel.fromJson(Map<String, dynamic> json) {
    return ProductsApiModel(
      id: json['id'],
      title: json['title'] ?? '',
      price: json['price'].toDouble() ?? 0,
      description: json['description'] ?? '',
      image: json['image'] ?? '',
      likes: json['likes'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['price'] = price;
    data['description'] = description;
    data['image'] = image;
    data['likes'] = likes;
    return data;
  }
}
