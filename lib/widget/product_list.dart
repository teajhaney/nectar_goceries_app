import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../all_path.dart';

class ProductList extends ConsumerStatefulWidget {
  final List<ProductsApiModel> products;

  const ProductList({super.key, required this.products});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProductListState();
}

class _ProductListState extends ConsumerState<ProductList>
    with AutomaticKeepAliveClientMixin {
  final _controller = ScrollController();

  Set<int> selectedProductIndex = <int>{};
  void toggleFavorite(int index) {
    setState(() {
      if (selectedProductIndex.contains(index)) {
        selectedProductIndex.remove(index);
      } else {
        selectedProductIndex.add(index);
      }
    });
  }

  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final favoriteItem = ref.read(favoriteListProvider);
    return SizedBox(
      height: 250,
      width: double.infinity,
      child: ListView.builder(
          controller: _controller,
          shrinkWrap: true,
          itemCount: widget.products.length,
          scrollDirection: Axis.horizontal,
          physics: const ScrollPhysics(),
          itemBuilder: (BuildContext context, index) {
            var product = widget.products[index];
            final isClicked = selectedProductIndex.contains(index);

            return Padding(
              padding: const EdgeInsets.only(right: 20),
              child: GestureDetector(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) =>
                        ProductDetailsScreen(products: product),
                  ),
                ),
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
                          '${product.title.substring(0, 15)}..',
                          style: getSemiBoldStyle(
                              color: ColorManager.black,
                              fontSize: FontSize.fs20),
                        ),
                        const Gap(10),

                        const Gap(20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '\$${product.price.toString().substring(0, 4)}',
                              style: getSemiBoldStyle(
                                  color: ColorManager.black,
                                  fontSize: FontSize.fs20),
                            ),
                            GestureDetector(
                              onTap: !isClicked
                                  ? () {
                                      favoriteItem.addToFavoriteProduct(
                                        title: product.title,
                                        image: product.image,
                                        productId: product.id,
                                        price: product.price,
                                        count: 1,
                                      );
                                      ScaffoldMessenger.of(context)
                                          .hideCurrentSnackBar();
                                      showSnackBar(
                                          context, 'Added to favorite');
                                      toggleFavorite(index);
                                    }
                                  : () {
                                      toggleFavorite(index);
                                      favoriteItem.removeFromFavoriteProduct(
                                          product.id);
                                    },
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: ColorManager.green,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(
                                  child: isClicked
                                      ? const Icon(Icons.check)
                                      : const Icon(Icons.add),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
