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
  double price;
  String image;
  int index;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FavoriteTileState();
}

class _FavoriteTileState extends ConsumerState<FavoriteTile> {
  @override
  Widget build(BuildContext context) {
    final favorite = ref.read(favoriteListProvider);
    return SizedBox(
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
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, AppMargin.m10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    favorite.removeFromFavoriteProduct(widget.index);
                  },
                  child: Text(
                    'X',
                    style: getSemiBoldStyle(
                        color: ColorManager.grey, fontSize: FontSize.fs20),
                  ),
                ),
                Text(
                  '\$${widget.price}'.substring(0, 5).toString(),
                  style: getBoldStyle(color: ColorManager.black),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
