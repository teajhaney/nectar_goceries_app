// ignore_for_file: depend_on_referenced_packages

import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '/all_path.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen>
    with AutomaticKeepAliveClientMixin {
  final AsyncMemoizer _memoizer = AsyncMemoizer();
  final _searchController = TextEditingController();

  // late Future<List<ProductsApiModel>> _futureProductApi;
  late ApiRespository respository;

  callApi() {
    respository = ApiRespository();
  }

  @override
  void initState() {
    callApi();
    super.initState();
  }

  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(
              left: AppSize.s20, top: AppSize.s20, right: AppSize.s20),
          child: Column(
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
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'See all',
                      style: getMediumStyle(
                          color: ColorManager.green, fontSize: FontSize.fs16),
                    ),
                  ),
                ],
              ),
              const Gap(20),
              FutureBuilder<List<ProductsApiModel>>(
                  future: respository.exclusiveProductApi(),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<ProductsApiModel>> snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text('${snapshot.hasError}'),
                      );
                    } else if (snapshot.data != null) {
                      if (snapshot.data!.isEmpty) {
                        return const Center(
                            child: Text("No Product to display"));
                      }
                      return ProductList(products: snapshot.data!);
                    }

                    return const Center(
                        child: CircularProgressIndicator(
                      color: Color(0xff18B762),
                    ));
                  }),
              const Gap(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Best Selling',
                    style: getSemiBoldStyle(
                        color: ColorManager.black, fontSize: FontSize.fs20),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'See all',
                      style: getMediumStyle(
                          color: ColorManager.green, fontSize: FontSize.fs16),
                    ),
                  ),
                ],
              ),
              const Gap(20),
              FutureBuilder<List<ProductsApiModel>>(
                  future: respository.bestSellingProductApi(),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<ProductsApiModel>> snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text('${snapshot.hasError}'),
                      );
                    } else if (snapshot.data != null) {
                      if (snapshot.data!.isEmpty) {
                        return const Center(
                            child: Text("No Product to display"));
                      }
                      return ProductList(products: snapshot.data!);
                    }

                    return const Center(
                        child: CircularProgressIndicator(
                      color: Color(0xff18B762),
                    ));
                  }),
              const Gap(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Groceries',
                    style: getSemiBoldStyle(
                        color: ColorManager.black, fontSize: FontSize.fs20),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'See all',
                      style: getMediumStyle(
                          color: ColorManager.green, fontSize: FontSize.fs16),
                    ),
                  ),
                ],
              ),
              const Gap(20),
              FutureBuilder<List<ProductsApiModel>>(
                  future: respository.groceriesProductApi(),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<ProductsApiModel>> snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text('${snapshot.hasError}'),
                      );
                    } else if (snapshot.data != null) {
                      if (snapshot.data!.isEmpty) {
                        return const Center(
                            child: Text("No Product to display"));
                      }
                      return ProductList(products: snapshot.data!);
                    }

                    return const Center(
                        child: CircularProgressIndicator(
                      color: Color(0xff18B762),
                    ));
                  }),
            ],
          ),
        ),
      ),
    );
  }

  Future<List<ProductsApiModel>>? fetchExclisiveProductApiOnce() {
    _memoizer.runOnce(() async {
      return respository.exclusiveProductApi();
    });
    return null;
  }

  Future<List<ProductsApiModel>>? fetchBestSellingProductApiOnce() {
    _memoizer.runOnce(() async {
      return respository.bestSellingProductApi();
    });
    return null;
  }

  Future<List<ProductsApiModel>>? fetchGroceriesProductApiOnce() {
    _memoizer.runOnce(() async {
      return respository.groceriesProductApi();
    });
    return null;
  }
}
