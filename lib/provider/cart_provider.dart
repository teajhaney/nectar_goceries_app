import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/all_path.dart';

final totalAmountProvider = StateProvider<double>((ref) {
  final cartList = ref.watch(cartListProvider).list;
  double totalAmount = 0;
  for (var item in cartList) {
    totalAmount += (item.price!) * (item.count);
  }
  return totalAmount;
});

final cartListProvider = ChangeNotifierProvider((ref) {
  return CartList();
});

class CartList extends ChangeNotifier {
  List<Cart> list = [];

  Future<void> addToCart({
    required String title,
    required String image,
    required int productId,
    required int price,
    required int count,
  }) async {
    final int itemIndex = list.indexWhere((element) => element.id == productId);
    if (itemIndex >= 0) {
      list[itemIndex].count += 1;
    } else {
      list.add(
        Cart(
          id: productId,
          title: title,
          price: price,
          image: image,
          count: count,
        ),
      );
    }
    notifyListeners();
  }

  void increment(int index) {
    list[index].count = list[index].count + 1;
    notifyListeners();
  }

  void decrement(int index) {
    if (list[index].count > 1) {
      list[index].count = list[index].count - 1;
      notifyListeners();
    }
  }

  void removeFromCart(int index) {
    // ignore: list_remove_unrelated_type
    list.removeAt(index);
    notifyListeners();
  }
}
