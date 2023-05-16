import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/all_path.dart';
import 'package:tuple/tuple.dart';

final totalAmountInfavoriteProvider = StateProvider((ref) {
  return ref
      .watch(favoriteListProvider)
      .list
      .map((e) => Tuple2(e.price!, e.count!))
      .fold<double>(
          0.0,
          (previousValue, element) =>
              previousValue + element.item1 * element.item2);
});

final favoriteListProvider = ChangeNotifierProvider((ref) {
  return FavoriteProductList();
});

class FavoriteProductList extends ChangeNotifier {
  List<FavoriteProduct> list = [];

  void addToFavoriteProduct({
    required String title,
    required String image,
    required int productId,
    required double price,
    required int count,
  }) {
    // if (list.contains(productId)) {
    //   list.removeAt(productId);
    //   list.insert(
    //       productId,
    //       FavoriteProduct(
    //         id: productId,
    //         title: title,
    //         price: price,
    //         count: count + 1,
    //         image: image,
    //       ));
    //   notifyListeners();
    // } else {
    list.add(FavoriteProduct(
      id: productId,
      title: title,
      price: price,
      count: count,
      image: image,
    ));
    notifyListeners();
  }

  void removeFromFavoriteProduct(int productId) {
    list.remove(productId);
    notifyListeners();
  }
}
