import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../all_path.dart';
import '../constants/constants.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

final _searchController = TextEditingController();
final _scrollController = ScrollController();

class _ExploreScreenState extends State<ExploreScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: AppSize.s20, top: AppSize.s20, right: AppSize.s20),
      child: Column(
        children: [
          Text(
            'Find Products',
            style: getMediumStyle(
                color: ColorManager.black, fontSize: FontSize.fs20),
          ),
          const Gap(20),
          TextFieldInput(
            textEditingController: _searchController,
            hintText: 'Search Store',
            textInputType: TextInputType.text,
          ),
          const Gap(20),
          Expanded(
            child: SingleChildScrollView(
              physics: const ScrollPhysics(),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 4 / 5,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20),
                shrinkWrap: true,
                controller: _scrollController,
                itemCount: category.length,
                itemBuilder: (context, index) {
                  return Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.green[200],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          image: AssetImage(category[index].image),
                        ),
                        const Gap(10),
                        Text(
                          category[index].categoryTitle,
                          style: getSemiBoldStyle(color: ColorManager.black),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
