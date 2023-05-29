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
  int counts = 0;
  int itemLCount(List<Cart> itemsList) {
    int counts = 0;
    for (var item in itemsList) {
      counts += item.count;
    }
    return counts;
  }

  Future<void> addToFavoriteProduct({
    required String title,
    required String image,
    required int productId,
    required double price,
    required int count,
  }) async {
    final int itemIndex = list.indexWhere((element) => element.id == productId);
    if (itemIndex >= 0) {
      list[itemIndex].count = 1;
    } else {
      list.add(
        FavoriteProduct(
          id: productId,
          title: title,
          price: price,
          image: image,
          count: 1,
        ),
      );
    }
    notifyListeners();
  }

  // void addToFavoriteProduct({
  //   required String title,
  //   required String image,
  //   required int productId,
  //   required double price,
  //   required int count,
  // }) {
  //   // if (list.contains(productId)) {
  //   //   list.removeAt(productId);
  //   //   list.insert(
  //   //       productId,
  //   //       FavoriteProduct(
  //   //         id: productId,
  //   //         title: title,
  //   //         price: price,
  //   //         count: count + 1,
  //   //         image: image,
  //   //       ));
  //   //   notifyListeners();
  //   // } else {
  //   list.add(FavoriteProduct(
  //     id: productId,
  //     title: title,
  //     price: price,
  //     count: count,
  //     image: image,
  //   ));
  //   notifyListeners();
  // }

  void removeFromFavoriteProduct(int index) {
    list.removeAt(index);
    notifyListeners();
  }
}
