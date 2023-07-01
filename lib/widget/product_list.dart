import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../all_path.dart';

class ProductList extends ConsumerStatefulWidget {
  final List<ProductsApiModel> products;

  const ProductList({super.key, required this.products});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProductListState();
}

class _ProductListState extends ConsumerState<ProductList>
    with SingleTickerProviderStateMixin {
  final _controller = ScrollController();

  var uuid = const Uuid();

  @override
  Widget build(BuildContext context) {
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
            bool isFavorite = favoriteItem.isFavorite(product.id);

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
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                color: ColorManager.green,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: AnimatedSwitcher(
                                duration: const Duration(milliseconds: 500),
                                child: IconButton(
                                  splashRadius: 0.1,
                                  key: ValueKey<bool>(isFavorite),
                                  icon: Icon(
                                    isFavorite ? Icons.check : Icons.add,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    favoriteItem.toggleFavorite(
                                      context: context,
                                      title: product.title,
                                      image: product.image,
                                      productId: product.id,
                                      price: product.price.toInt(),
                                      count: 1,
                                    );
                                    setState(() {
                                      isFavorite = true;
                                    });
                                  },
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
