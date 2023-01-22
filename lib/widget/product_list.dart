import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../all_path.dart';

class ProductList extends StatelessWidget {
  final List<ProductsApiModel> products;

  ProductList({super.key, required this.products});

  final _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: double.infinity,
      child: ListView.builder(
          controller: _controller,
          shrinkWrap: true,
          itemCount: products.length,
          scrollDirection: Axis.horizontal,
          physics: const ScrollPhysics(),
          itemBuilder: (BuildContext context, index) {
            var product = products[index];

            return Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Container(
                width: 170,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 0.2, color: ColorManager.grey),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 10, right: 10, bottom: 10, top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // height: 80
                      Center(
                        child: product.image.isNotEmpty
                            ? Image.network(
                                product.image,
                                height: 80,
                              )
                            : Image.asset(
                                ImageAssetManager.carrotColored,
                                height: 80,
                              ),
                      ),
                      const Gap(20),
                      Text(
                        product.title.substring(0, 8),
                        style: getSemiBoldStyle(
                            color: ColorManager.black, fontSize: FontSize.fs20),
                      ),
                      const Gap(10),
                      Text(
                        '03',
                        style: getLightStyle(
                            color: ColorManager.grey, fontSize: FontSize.fs16),
                      ),
                      const Gap(20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${product.price}',
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
                                borderRadius: BorderRadius.circular(20),
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
  }
}
