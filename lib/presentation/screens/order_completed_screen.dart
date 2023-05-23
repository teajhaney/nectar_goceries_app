import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:nectar_groceries_app/all_path.dart';
import 'package:go_router/go_router.dart';

class OrderCompltedScreen extends StatelessWidget {
  const OrderCompltedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 130),
            child: Column(
              children: [
                Image.asset(ImageAssetManager.orderComplete),
                const Gap(AppSize.s40),
                Text(
                  'Your Order has been accepted',
                  style: getBoldStyle(
                      color: ColorManager.black, fontSize: FontSize.fs40),
                  textAlign: TextAlign.center,
                ),
                const Gap(AppSize.s20),
                Text(
                  'Your items has been placcd and is on it’s way to being processed',
                  style: getSemiBoldStyle(
                      color: ColorManager.grey, fontSize: FontSize.fs18),
                  textAlign: TextAlign.center,
                ),
                const Gap(AppSize.s40),
                GestureDetector(
                  onTap: () => context.replaceNamed(RouteConstants.navScreen),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: AppSize.s20, right: AppSize.s20),
                    child: Container(
                      height: 70,
                      width: double.maxFinite,
                      alignment: Alignment.center,
                      decoration: ShapeDecoration(
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(AppSize.s20))),
                          color: ColorManager.green),
                      child: Text(
                        StringManager.backHome,
                        style: getRegularStyle(
                            color: ColorManager.white, fontSize: FontSize.fs20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
