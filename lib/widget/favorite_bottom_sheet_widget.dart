import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../all_path.dart';

class FavoriteBottomSheetWidget extends ConsumerStatefulWidget {
  final double totalprice;
  const FavoriteBottomSheetWidget({super.key, required this.totalprice});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _FavoriteBottomSheetWidgetState();
}

class _FavoriteBottomSheetWidgetState
    extends ConsumerState<FavoriteBottomSheetWidget> {
  @override
  Widget build(BuildContext context) {
    final favoriteList = ref.watch(favoriteListProvider);
    return Padding(
      padding: const EdgeInsets.only(bottom: AppMargin.m20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: Text(
              'Checkout',
              style: getBoldStyle(color: ColorManager.black),
            ),
            trailing: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.cancel_outlined)),
          ),
          const Divider(),
          ListTile(
            title: Text(
              'Delivery',
              style: getSemiBoldStyle(
                  color: ColorManager.grey, fontSize: FontSize.fs20),
            ),
            trailing: Text(
              'Selected Method',
              style: getSemiBoldStyle(
                  color: ColorManager.black, fontSize: FontSize.fs20),
            ),
          ),
          const Divider(
            indent: AppMargin.m16,
            endIndent: AppMargin.m16,
          ),
          ListTile(
            title: Text(
              'Payment',
              style: getSemiBoldStyle(
                  color: ColorManager.grey, fontSize: FontSize.fs20),
            ),
            trailing: Text(
              'Select card',
              style: getSemiBoldStyle(
                  color: ColorManager.black, fontSize: FontSize.fs20),
            ),
          ),
          const Divider(
            indent: AppMargin.m16,
            endIndent: AppMargin.m16,
          ),
          ListTile(
            title: Text(
              'Promo Code',
              style: getSemiBoldStyle(
                  color: ColorManager.grey, fontSize: FontSize.fs20),
            ),
            trailing: Text(
              'Pick discount',
              style: getSemiBoldStyle(
                  color: ColorManager.black, fontSize: FontSize.fs20),
            ),
          ),
          const Divider(
            indent: AppMargin.m16,
            endIndent: AppMargin.m16,
          ),
          ListTile(
            title: Text(
              'Total cost',
              style: getSemiBoldStyle(
                  color: ColorManager.grey, fontSize: FontSize.fs20),
            ),
            trailing: Text(
              '\$${widget.totalprice}',
              style: getSemiBoldStyle(
                  color: ColorManager.black, fontSize: FontSize.fs20),
            ),
          ),
          const Divider(
            indent: AppMargin.m16,
            endIndent: AppMargin.m16,
          ),
          Padding(
            padding: const EdgeInsets.only(left: AppMargin.m16),
            child: Text(
              StringManager.termsAndCondition,
              style: getSemiBoldStyle(color: ColorManager.black),
            ),
          ),
          const Gap(20),
          GestureDetector(
            onTap: () {
              context.replaceNamed(RouteConstants.orderCompletedScreen);
              setState(() {
                favoriteList.list = [];
              });
            },
            child: Padding(
              padding:
                  const EdgeInsets.only(left: AppSize.s20, right: AppSize.s20),
              child: Container(
                height: 70,
                width: double.maxFinite,
                alignment: Alignment.center,
                decoration: ShapeDecoration(
                    shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.all(Radius.circular(AppSize.s20))),
                    color: ColorManager.green),
                child: Text(
                  StringManager.placeOrder,
                  style: getRegularStyle(
                      color: ColorManager.white, fontSize: FontSize.fs20),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
