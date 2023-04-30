import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:nectar_groceries_app/all_path.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.products});
  final ProductsApiModel products;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int _counter = 0;

  void _incremmentCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decremmentCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: 300,
              decoration: BoxDecoration(
                color: ColorManager.white,
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    spreadRadius: -1,
                    blurRadius: 5,
                    color: ColorManager.grey.withOpacity(.4),
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () => Navigator.of(context).pop(),
                          icon: Icon(
                            Icons.chevron_left,
                            color: ColorManager.black,
                            size: 30,
                          )),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.share,
                            color: ColorManager.black,
                            size: 30,
                          ))
                    ],
                  ),
                  Image(
                    image: NetworkImage(widget.products.image),
                    height: 200,
                    width: 200,
                  ),
                ],
              ),
            ),
            const Gap(20),
            Padding(
              padding:
                  const EdgeInsets.only(left: AppSize.s20, right: AppSize.s20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${widget.products.title.substring(0, 15)}...',
                    style: getBoldStyle(color: ColorManager.black),
                  ),
                  IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: Icon(
                        Icons.favorite_border,
                        color: ColorManager.grey,
                        size: 25,
                      )),
                ],
              ),
            ),
            const Gap(15),
            Padding(
              padding:
                  const EdgeInsets.only(left: AppSize.s20, right: AppSize.s20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: _decremmentCounter,
                          icon: Icon(
                            Icons.remove,
                            color: ColorManager.grey,
                            size: 30,
                          )),
                      Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                          color: ColorManager.green,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            _counter.toString(),
                            style: getBoldStyle(color: ColorManager.black),
                          ),
                        ),
                      ),
                      IconButton(
                          onPressed: _incremmentCounter,
                          icon: Icon(
                            Icons.add,
                            color: ColorManager.green,
                            size: 30,
                          )),
                    ],
                  ),
                  Text(
                    '\$${widget.products.price.toString()}',
                    style: getBoldStyle(color: ColorManager.black),
                  ),
                ],
              ),
            ),
            const Gap(20),
            Padding(
              padding:
                  const EdgeInsets.only(left: AppSize.s20, right: AppSize.s20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    StringManager.productsDetails,
                    style: getSemiBoldStyle(
                        color: ColorManager.black, fontSize: FontSize.fs20),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.keyboard_arrow_down,
                        color: ColorManager.black,
                        size: 25,
                      )),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: AppSize.s20, right: AppSize.s20),
              child: SizedBox(
                height: 200,
                child: Text(
                  widget.products.description,
                  style: getRegularStyle(
                      color: ColorManager.grey, fontSize: FontSize.fs16),
                ),
              ),
            ),
            const Gap(30),
            Padding(
              padding:
                  const EdgeInsets.only(left: AppSize.s20, right: AppSize.s20),
              child: InkWell(
                  onTap: () {},
                  child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding:
                          const EdgeInsets.symmetric(vertical: AppPadding.p24),
                      decoration: ShapeDecoration(
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(AppSize.s20))),
                          color: ColorManager.green),
                      child: Text(
                        StringManager.addToBasket,
                        style: getRegularStyle(
                            color: ColorManager.white, fontSize: FontSize.fs20),
                      ))),
            )
          ],
        ),
      ),
    );
  }
}
