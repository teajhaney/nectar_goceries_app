import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

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
    final totalPrice = ref.watch(totalAmountProvider);
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
                      StringManager.myCart,
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
        : Scaffold(
            body: Padding(
                padding: const EdgeInsets.only(
                    left: AppSize.s20, top: AppSize.s20, right: AppSize.s20),
                child: Column(
                  children: [
                    SizedBox(
                      height: 100,
                      width: double.infinity,
                      child: Center(
                        child: Text(
                          StringManager.myCart,
                          style: getBoldStyle(color: ColorManager.black),
                        ),
                      ),
                    ),
                    const Divider(),
                    Expanded(
                      child: ListView.separated(
                        itemBuilder: ((context, index) => CartTile(
                              id: cart.list[index].id!,
                              title: cart.list[index].title!,
                              price: cart.list[index].price!,
                              count: cart.list[index].count,
                              image: cart.list[index].image!,
                              index: index,
                            )),
                        separatorBuilder: (BuildContext context, int index) =>
                            const Divider(),
                        itemCount: cart.list.length,
                      ),
                    ),
                  ],
                )),
            floatingActionButton: Padding(
              padding:
                  const EdgeInsets.only(left: AppSize.s40, right: AppSize.s20),
              child: GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                      elevation: 0,
                      isDismissible: false,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20))),
                      context: context,
                      builder: (context) {
                        return BottomSheetWidget(
                          totalprice: totalPrice,
                        );
                      });
                },
                child: Container(
                    height: 70,
                    width: double.maxFinite,
                    alignment: Alignment.center,
                    decoration: ShapeDecoration(
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(AppSize.s20))),
                        color: ColorManager.green),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          StringManager.goToCheckOut,
                          style: getRegularStyle(
                              color: ColorManager.white,
                              fontSize: FontSize.fs20),
                        ),
                        const Gap(20),
                        Text(
                          '\$${totalPrice.round()}',
                          style: getRegularStyle(
                              color: ColorManager.black,
                              fontSize: FontSize.fs20),
                        ),
                      ],
                    )),
              ),
            ),
          );
  }
}
