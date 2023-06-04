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

  toggleFavorite({
    required String title,
    required String image,
    required int productId,
    required int price,
    required int count,
    required BuildContext context,
  }) {
    final int itemIndex = list.indexWhere((element) => element.id == productId);

    if (itemIndex >= 0) {
      list.removeWhere((element) => element.id == productId);

      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      showSnackBar(context, 'Remove from favorite');
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
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      showSnackBar(context, 'Added to favorite');
    }
    notifyListeners();
  }

  bool isFavorite(int productId) {
    return list.any((item) => item.id == productId);
  }

  void removeFromFavoriteProduct(int index) {
    list.removeAt(index);
    notifyListeners();
  }
}
