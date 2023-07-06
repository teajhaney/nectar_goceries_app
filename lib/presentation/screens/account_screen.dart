import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:nectar_groceries_app/all_path.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class AccountScreen extends ConsumerStatefulWidget {
  const AccountScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AccountScreenState();
}

class _AccountScreenState extends ConsumerState<AccountScreen> {
  bool _isLoading = false;
  void logoutUser() async {
    setState(() {
      _isLoading = true;
    });
    //sign out user
    await AuthMethods().signOutUser();

    setState(() {
      _isLoading = false;
    });
    if (!mounted) return;
    context.replaceNamed(RouteConstants.loginScreen);

    setState(() {
      _isLoading = false;
      ref.read(cartListProvider).list = [];
      ref.read(favoriteListProvider).list = [];
    });
    if (!mounted) return;
    showSnackBar(context, 'Logged out succesfully');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage:
                      AssetImage(ImageAssetManager.backgroundImage),
                ),
                const Gap(20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Omotayo Olarenwaju',
                      style: getBoldStyle(
                        color: ColorManager.black,
                      ),
                    ),
                    const Gap(10),
                    Text(
                      'Anonymous@gmail.com',
                      style: getSemiBoldStyle(color: ColorManager.grey),
                    ),
                  ],
                )
              ],
            ),
            const Gap(20),
            const Divider(),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    final accounts = account[index];
                    return ListTile(
                      title: Text(
                        accounts.title,
                        style: getBoldStyle(color: ColorManager.black),
                      ),
                      leading: accounts.leading,
                      trailing: accounts.trailing,
                    );
                  },
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: account.length),
            ),
            GestureDetector(
              onTap: logoutUser,
              child: Container(
                height: 70,
                width: double.maxFinite,
                alignment: Alignment.center,
                decoration: ShapeDecoration(
                    shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.all(Radius.circular(AppSize.s20))),
                    color: ColorManager.whiteGrey),
                child: !_isLoading
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.logout,
                            color: ColorManager.green,
                          ),
                          Text(
                            StringManager.logout,
                            style: getRegularStyle(
                                color: ColorManager.green,
                                fontSize: FontSize.fs20),
                          ),
                          const Gap(20),
                        ],
                      )
                    : CircularProgressIndicator(
                        color: ColorManager.green,
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
