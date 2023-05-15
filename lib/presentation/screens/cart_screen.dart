import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../all_path.dart';

class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final cart = ref.watch(cartListProvider);
    return (cart.list.isEmpty)
        ? Padding(
            padding: const EdgeInsets.only(
                left: AppSize.s20, top: AppSize.s20, right: AppSize.s20),
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      'My Cart',
                      style: getBoldStyle(color: ColorManager.black),
                    ),
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.shopping_cart_outlined,
                        size: 48,
                        color: ColorManager.green,
                      ),
                      const SizedBox(height: 16),
                      const Text("Your cart is empty!!"),
                    ],
                  ),
                )
              ],
            ))
        : Padding(
            padding: const EdgeInsets.only(
                left: AppSize.s20, top: AppSize.s20, right: AppSize.s20),
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      'My Cart',
                      style: getBoldStyle(color: ColorManager.black),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.separated(
                    itemBuilder: ((context, index) => CartTile(
                          id: cart.list[index].id,
                          title: cart.list[index].title,
                          price: cart.list[index].price,
                          count: cart.list[index].count,
                          image: cart.list[index].image,
                        )),
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(),
                    itemCount: cart.list.length,
                  ),
                )
              ],
            ));
  }
}
