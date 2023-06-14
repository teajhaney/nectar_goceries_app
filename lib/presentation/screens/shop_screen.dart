import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '/all_path.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class ShopScreen extends ConsumerStatefulWidget {
  const ShopScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ShopScreenState();
}

class _ShopScreenState extends ConsumerState<ShopScreen>
    with AutomaticKeepAliveClientMixin {
  final _searchController = TextEditingController();

  // late Future<List<ProductsApiModel>> _futureProductApi;
  late ApiRespository respository;

  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    final exclusiveProducts = ref.watch(exclusiveProductProvider);
    final bestSellingProducts = ref.watch(bestSellingProductProvider);
    final groceriesProducts = ref.watch(groceriesProductProvider);
    super.build(context);
    return Scaffold(
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(
              left: AppSize.s20, top: AppSize.s20, right: AppSize.s20),
          child: Column(
            key: const PageStorageKey('ShopScreen'),
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image(
                  image: AssetImage(ImageAssetManager.carrotColored),
                ),
              ),
              const Gap(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.location_pin,
                    color: ColorManager.black,
                  ),
                  Text(
                    'Lagos, Nigeria',
                    style: getMediumStyle(
                        color: ColorManager.black, fontSize: FontSize.fs20),
                  ),
                ],
              ),
              const Gap(20),
              Padding(
                padding: const EdgeInsets.only(),
                child: TextFieldInput(
                  textEditingController: _searchController,
                  hintText: 'Search Store',
                  textInputType: TextInputType.text,
                ),
              ),
              const Gap(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Exclusive Offer',
                    style: getSemiBoldStyle(
                        color: ColorManager.black, fontSize: FontSize.fs20),
                  ),
                ],
              ),
              const Gap(20),
              exclusiveProducts.when(
                data: (List<ProductsApiModel> value) {
                  return ProductList(products: value);
                },
                loading: () => const Center(
                  child: CircularProgressIndicator(
                    color: Color(0xff18B762),
                  ),
                ),
                error: (error, stackTrace) {
                  return const Center(
                      child: Text(
                          "No Product to display")); // Display the error message
                },
              ),
              const Gap(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Best Selling',
                    style: getSemiBoldStyle(
                        color: ColorManager.black, fontSize: FontSize.fs20),
                  ),
                ],
              ),
              const Gap(20),
              bestSellingProducts.when(
                data: (List<ProductsApiModel> value) {
                  return ProductList(products: value);
                },
                loading: () => const Center(
                  child: CircularProgressIndicator(
                    color: Color(0xff18B762),
                  ),
                ),
                error: (error, stackTrace) {
                  return const Center(
                      child: Text(
                          "No Product to display")); // Display the error message
                },
              ),
              const Gap(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Groceries',
                    style: getSemiBoldStyle(
                        color: ColorManager.black, fontSize: FontSize.fs20),
                  ),
                ],
              ),
              const Gap(20),
              groceriesProducts.when(
                data: (List<ProductsApiModel> value) {
                  return ProductList(products: value);
                },
                loading: () => const Center(
                  child: CircularProgressIndicator(
                    color: Color(0xff18B762),
                  ),
                ),
                error: (error, stackTrace) {
                  return const Center(
                      child: Text(
                          "No Product to display")); // Display the error message
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
