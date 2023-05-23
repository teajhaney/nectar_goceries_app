import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nectar_groceries_app/all_path.dart';

final exclusiveProductProvider =
    FutureProvider<List<ProductsApiModel>>((ref) async {
  return ref.watch(apiProvider).exclusiveProductApi();
});

final bestSellingProductProvider =
    FutureProvider<List<ProductsApiModel>>((ref) async {
  return ref.watch(apiProvider).bestSellingProductApi();
});

final groceriesProductProvider =
    FutureProvider<List<ProductsApiModel>>((ref) async {
  return ref.watch(apiProvider).groceriesProductApi();
});
