// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import '../all_path.dart';

class CartTile extends ConsumerStatefulWidget {
  CartTile({
    super.key,
    required this.id,
    required this.title,
    required this.price,
    required this.image,
    required this.count,
    required this.index,
  });
  int? id;
  String title;
  double price;
  String image;
  late int count;
  int index;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CartTileState();
}

class _CartTileState extends ConsumerState<CartTile>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final cart = ref.read(cartListProvider);
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
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${widget.title.toString().substring(0, 15)}...',
                    style: getBoldStyle(color: ColorManager.black),
                  ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () => cart.decrement(widget.index),
                          icon: Icon(
                            Icons.remove,
                            color: ColorManager.grey,
                            size: 30,
                          )),
                      const Gap(5),
                      Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border:
                                Border.all(width: 1, color: ColorManager.grey)),
                        child: Center(
                          child: Text(
                            widget.count.toString(),
                            style: getSemiBoldStyle(color: ColorManager.black),
                          ),
                        ),
                      ),
                      const Gap(5),
                      IconButton(
                          onPressed: () => cart.increment(widget.index),
                          icon: Icon(
                            Icons.add,
                            color: ColorManager.green,
                            size: 30,
                          )),
                    ],
                  )
                ],
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  cart.removeFromCart(widget.index);
                },
                child: Text(
                  'X',
                  style: getSemiBoldStyle(
                      color: ColorManager.grey, fontSize: FontSize.fs20),
                ),
              ),
              const Gap(10),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, AppMargin.m10),
                child: Text(
                  '\$${widget.count * widget.price}'.substring(0, 7).toString(),
                  style: getBoldStyle(color: ColorManager.black),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
