import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import '/all_path.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp.router(
    debugShowCheckedModeBanner: false,
    title: 'Flutter Demo',
    theme: getApplicationTheme(),
    routerDelegate: AppRouter().router.routerDelegate,
    routeInformationParser: AppRouter().router.routeInformationParser,
    routeInformationProvider: AppRouter().router.routeInformationProvider,
  ));
}
