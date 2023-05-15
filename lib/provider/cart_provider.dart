import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/all_path.dart';

final cartListProvider = ChangeNotifierProvider((ref) {
  return CartList();
});

class CartList extends ChangeNotifier {
  List<Cart> list = [];

  void addToCart(
      {required String title,
      required String image,
      required int productId,
      required double price,
      required int count}) {
    list.add(Cart(
      id: productId,
      title: title,
      price: price,
      count: count,
      image: image,
    ));
    notifyListeners();
  }
}
