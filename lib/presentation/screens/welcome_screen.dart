import 'package:flutter/material.dart';
import '/widget/widgets.dart';
import '/presentation/constants/constants.dart';

import 'package:go_router/go_router.dart';
import 'package:gap/gap.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage(
          ImageAssetManager.backgroundImage,
        ),
      )),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Positioned(
            bottom: 130,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image(
                  image: AssetImage(ImageAssetManager.carrot),
                ),
                const Gap(30),
                DefaultTextStyle(
                  style: const TextStyle(decoration: TextDecoration.none),
                  child: Text(
                    StringManager.welcome,
                    style: getSemiBoldStyle(
                      color: ColorManager.white,
                      fontSize: FontSize.fs55,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const Gap(20),
                DefaultTextStyle(
                  style: const TextStyle(decoration: TextDecoration.none),
                  child: Text(
                    StringManager.subWelcome,
                    style: getMediumStyle(
                      color: ColorManager.grey,
                      fontSize: FontSize.fs20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const Gap(50),
                ElevatedTextButton(
                  buttonText: StringManager.getStarted,
                  onPressed: () =>
                      context.replaceNamed(RouteConstants.loginScreen),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
