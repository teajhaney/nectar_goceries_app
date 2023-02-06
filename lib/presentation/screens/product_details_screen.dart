import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nectar_groceries_app/all_path.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.products});
  final ProductsApiModel products;
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
                          onPressed: () => Navigator.of(context).pop(),
                          icon: Icon(
                            Icons.share,
                            color: ColorManager.black,
                            size: 30,
                          ))
                    ],
                  ),
                  Image(
                    image: NetworkImage(products.image),
                    height: 200,
                    width: 200,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
