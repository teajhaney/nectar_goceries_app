class FavoriteProduct {
  FavoriteProduct({
    required this.id,
    required this.title,
    required this.price,
    required this.image,
    required this.count,
  });

  FavoriteProduct.fromJson(
    dynamic json,
  ) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    image = json['image'] ?? "";
    count = json['count'] ?? "";
  }

  int? id;
  String? title;
  double? price;
  String? image;
  int? count;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['image'] = image;
    map['count'] = 1;
    return map;
  }

  FavoriteProduct copyWith({
    int? id,
    String? title,
    double? price,
    String? image,
    int? count,
  }) {
    return FavoriteProduct(
      id: id ?? this.id,
      title: title ?? this.title,
      image: image ?? this.image,
      price: price ?? this.price,
      count: count ?? this.count,
    );
  }
}
