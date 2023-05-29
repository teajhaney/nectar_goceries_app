import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:nectar_groceries_app/widget/favorite_tile.dart';

import '../../all_path.dart';

class FavoriteScreen extends ConsumerStatefulWidget {
  const FavoriteScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends ConsumerState<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    final cart = ref.watch(favoriteListProvider);
    final totalPrice = ref.watch(totalAmountInfavoriteProvider);
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
                      StringManager.favorite,
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
                        Icons.favorite_border_outlined,
                        size: 48,
                        color: ColorManager.green,
                      ),
                      const SizedBox(height: 16),
                      const Text("Your favorite is empty!!"),
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
                        itemBuilder: ((context, index) => FavoriteTile(
                              index: index,
                              id: cart.list[index].id!,
                              title: cart.list[index].title!,
                              price: cart.list[index].price!,
                              image: cart.list[index].image!,
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
                          '\$$totalPrice'.substring(0, 7),
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
