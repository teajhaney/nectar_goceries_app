import 'dart:async';
import 'package:flutter/material.dart';

import 'package:gap/gap.dart';

import '/all_path.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  final _searchController = TextEditingController();
  final _controller = ScrollController();
  late Future _futureProductApi;
  late ApiRespository respository;
  @override
  void initState() {
    callApi();
    super.initState();
  }

  callApi() {
    respository = ApiRespository();
    _futureProductApi = respository.productApi();
  }

  @override
  Widget build(BuildContext context) {
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
              FutureBuilder(
                  future: _futureProductApi,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      var productsData = snapshot.data;
                      print(snapshot.data);
                      return SizedBox(
                        height: 250,
                        width: double.infinity,
                        child: ListView.builder(
                            controller: _controller,
                            shrinkWrap: true,
                            itemCount: 20,
                            scrollDirection: Axis.horizontal,
                            physics: const ScrollPhysics(),
                            itemBuilder: (BuildContext context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: Container(
                                  width: 170,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        width: 0.2, color: ColorManager.grey),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10,
                                        right: 10,
                                        bottom: 10,
                                        top: 20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Center(
                                          child: Image(
                                            image: AssetImage(ImageAssetManager
                                                .carrotColored),
                                            height: 80,
                                          ),
                                        ),
                                        const Gap(20),
                                        Text(
                                          'Produc name',
                                          style: getSemiBoldStyle(
                                              color: ColorManager.black,
                                              fontSize: FontSize.fs20),
                                        ),
                                        const Gap(10),
                                        Text(
                                          'Product quantity',
                                          style: getLightStyle(
                                              color: ColorManager.grey,
                                              fontSize: FontSize.fs16),
                                        ),
                                        const Gap(20),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              '\$4.99',
                                              style: getSemiBoldStyle(
                                                  color: ColorManager.black,
                                                  fontSize: FontSize.fs20),
                                            ),
                                            GestureDetector(
                                              onTap: () {},
                                              child: Container(
                                                height: 50,
                                                width: 50,
                                                decoration: BoxDecoration(
                                                  color: ColorManager.green,
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                child: const Center(
                                                  child: Icon(Icons.add),
                                                ),
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }),
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text('${snapshot.hasError}'),
                      );
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
