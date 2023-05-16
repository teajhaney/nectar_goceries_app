import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/all_path.dart';
import 'package:tuple/tuple.dart';

final totalAmountProvider = StateProvider((ref) {
  return ref
      .watch(cartListProvider)
      .list
      .map((e) => Tuple2(e.price!, e.count!))
      .fold<double>(
          0.0,
          (previousValue, element) =>
              previousValue + element.item1 * element.item2);
});

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
    // if (list.contains(productId)) {
    //   list.removeAt(productId);
    //   list.insert(
    //       productId,
    //       Cart(
    //         id: productId,
    //         title: title,
    //         price: price,
    //         count: count + 1,
    //         image: image,
    //       ));
    //   notifyListeners();
    // } else {
    list.add(Cart(
      id: productId,
      title: title,
      price: price,
      count: count,
      image: image,
    ));
    notifyListeners();
  }

  void removeFromCart(int productId) {
    list.remove(productId);
    notifyListeners();
  }
}

 



// void addToCart(
//       {String? title,
//       String? image,
//       required int productId,
//       double? price,
//       int? count}) {
//     if (_list.containsKey(productId)) {
//       _list.update(
//           productId.toString(),
//           (value) => Cart(
//                 id: value.id,
//                 title: value.title,
//                 price: value.price,
//                 count: value.count! + 1,
//                 image: value.image,
//               ));
//     } else {
//       _list.putIfAbsent(
//           productId.toString(),
//           () => Cart(
//                 id: productId,
//                 title: title,
//                 price: price,
//                 count: count,
//                 image: image,
//               ));
//     }

//     notifyListeners();