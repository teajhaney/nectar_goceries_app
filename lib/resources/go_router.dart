import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../presentation/constants/constants.dart';
import '../presentation/screens/screens.dart';

class AppRouter {
  GoRouter router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        name: RouteConstants.splashScreen,
        path: '/',
        builder: (BuildContext context, GoRouterState state) =>
            const SplashScreen(),
      ),
      GoRoute(
        name: RouteConstants.welcomeScreen,
        path: '/welcomeScreen',
        builder: (BuildContext context, GoRouterState state) =>
            const WelcomeScreen(),
      ),
      GoRoute(
        name: RouteConstants.loginScreen,
        path: '/loginScreen',
        builder: (BuildContext context, GoRouterState state) =>
            const LoginScreen(),
        // routes: [
        //   GoRoute(
        //     name: RouteConstants.signupScreen,
        //     path: 'signupScreen',
        //     builder: (BuildContext context, GoRouterState state) =>
        //         const SignupScreen(),
        //   ),
        // ]),
      ),
      GoRoute(
        name: RouteConstants.signupScreen,
        path: '/signupScreen',
        builder: (BuildContext context, GoRouterState state) =>
            const SignupScreen(),
      ),
      GoRoute(
        name: RouteConstants.navScreen,
        path: '/navScreen',
        builder: (BuildContext context, GoRouterState state) =>
            const NavScreen(),
      ),
    ],
  );
}
