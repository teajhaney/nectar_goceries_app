class Cart {
  Cart({
    required this.id,
    required this.title,
    required this.price,
    required this.image,
    required this.count,
  });

  Cart.fromJson(dynamic json, this.count) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    image = json['image'] ?? "";
    count = json['count'];
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
    map['count'] = count;
    return map;
  }

  Cart copyWith({
    int? id,
    String? title,
    double? price,
    String? image,
  }) {
    return Cart(
      id: id ?? this.id,
      title: title ?? this.title,
      image: image ?? this.image,
      price: price ?? this.price,
      count: count ?? count,
    );
  }
}
