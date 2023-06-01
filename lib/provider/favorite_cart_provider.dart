import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/all_path.dart';

final totalAmountInfavoriteProvider = StateProvider<double>((ref) {
  final favoritetList = ref.watch(favoriteListProvider).list;
  double totalAmount = 0.0;
  for (var item in favoritetList) {
    totalAmount += (item.price ?? 0.0) * (item.count!);
  }
  return totalAmount;
});

final favoriteListProvider = ChangeNotifierProvider((ref) {
  return FavoriteProductList();
});

class FavoriteProductList extends ChangeNotifier {
  List<FavoriteProduct> list = [];
  int counts = 0;

  int itemLCount(List<FavoriteProduct> itemsList) {
    int counts = 0;
    for (var item in itemsList) {
      counts += item.count!;
    }
    return counts;
  }

  final Set<int> _favoriteIndex = {};

  Set<int> get favoriteIndex => _favoriteIndex;

  Future<void> addToFavoriteProduct({
    required String title,
    required String image,
    required int productId,
    required int price,
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
          count: counts,
        ),
      );
    }
    notifyListeners();
  }

  void toggleFavorite(int item) {
    if (_favoriteIndex.contains(item)) {
      _favoriteIndex.remove(item);
      removeFromFavoriteProduct(item);
    } else {
      _favoriteIndex.add(item);
      addToFavoriteProduct;
    }
    notifyListeners();
  }

  bool isFavorite(int item) {
    return _favoriteIndex.contains(item);
  }

  void removeFromFavoriteProduct(int index) {
    _favoriteIndex.remove(index);
    list.removeAt(index);
    notifyListeners();
  }
}
