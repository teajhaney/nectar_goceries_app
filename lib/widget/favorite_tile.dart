// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import '../all_path.dart';

class FavoriteTile extends ConsumerStatefulWidget {
  FavoriteTile({
    super.key,
    required this.index,
    required this.id,
    required this.title,
    required this.price,
    required this.image,
  });
  int? id;
  String title;
  int price;
  String image;
  int index;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FavoriteTileState();
}

class _FavoriteTileState extends ConsumerState<FavoriteTile> {
  @override
  Widget build(BuildContext context) {
    final favorite = ref.watch(favoriteListProvider);
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) {
        favorite.removeFromFavoriteProduct(widget.index);

        // favorite.toggleFavorite(
        //     title: widget.title,
        //     image: widget.image,
        //     productId: widget.id!,
        //     price: widget.price,
        //     count: 1,
        //     context: context);
      },
      background: Container(
        color: ColorManager.green,
      ),
      child: SizedBox(
        height: 100,
        width: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.network(
                  widget.image,
                  width: 50,
                ),
                const Gap(10),
                Text(
                  '${widget.title.toString().substring(0, 15)}...',
                  style: getBoldStyle(color: ColorManager.black),
                ),
              ],
            ),
            const Gap(10),
            Text(
              '\$${widget.price}'.toString(),
              style: getBoldStyle(color: ColorManager.black),
            )
          ],
        ),
      ),
    );
  }
}
