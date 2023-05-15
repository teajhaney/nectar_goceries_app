import 'dart:async';

import 'package:flutter/material.dart';
import '../constants/constants.dart';

import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2),
        () => context.replaceNamed(RouteConstants.welcomeScreen));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.green,
      body: Center(
        child: Image(
          image: AssetImage(ImageAssetManager.logo1),
        ),
      ),
    );
  }
}
