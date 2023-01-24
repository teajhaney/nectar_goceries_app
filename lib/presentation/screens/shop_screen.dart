import 'package:cloud_firestore/cloud_firestore.dart';
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
          padding: const EdgeInsets.only(left: AppSize.s20, top: AppSize.s20),
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
                  const Icon(Icons.location_pin),
                  Text(
                    'Lagos, Nigeria',
                    style: getMediumStyle(
                        color: ColorManager.black, fontSize: FontSize.fs20),
                  ),
                ],
              ),
              const Gap(20),
              Padding(
                padding: const EdgeInsets.only(right: AppSize.s20),
                child: TextFieldInput(
                  textEditingController: _searchController,
                  hintText: 'Search Store',
                  textInputType: TextInputType.text,
                ),
              ),
              const Gap(20),
              Padding(
                padding: const EdgeInsets.only(right: AppSize.s20),
                child: Row(
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
              Padding(
                padding: const EdgeInsets.only(right: AppSize.s20),
                child: Row(
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
              ),
              const Gap(20),
              FutureBuilder<List<ProductsApiModel>>(
                  future: respository.bestSellingProductApi2(),
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
              Padding(
                padding: const EdgeInsets.only(right: AppSize.s20),
                child: Row(
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
              ),
              const Gap(20),
              FutureBuilder<List<ProductsApiModel>>(
                  future: respository.groceriesProductApi2(),
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
}
