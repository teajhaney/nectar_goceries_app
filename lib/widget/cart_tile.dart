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
  });
  int? id;
  String? title;
  double? price;
  String? image;
  int? count;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CartTileState();
}

class _CartTileState extends ConsumerState<CartTile> {
  int _counter = 0;

  _incremmentCounter(int counter) {
    setState(() {
      counter++;
    });
  }

  _decremmentCounter(int counter) {
    setState(() {
      counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    final counter = widget.count;
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
                '${widget.image}',
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
                          onPressed: _decremmentCounter(counter!),
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
                            '$counter',
                            style: getSemiBoldStyle(color: ColorManager.black),
                          ),
                        ),
                      ),
                      const Gap(5),
                      IconButton(
                          onPressed: _incremmentCounter(counter),
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
                onTap: () {},
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
                  '${widget.price}',
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
