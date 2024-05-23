import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:flutterbaseapp/feature/splash/presentation/views/splash_page.dart';

import '../navigation/app_lifecycle_overlay.dart';
import '../navigation/nav_bottom.dart';
import '../utils/globals.dart' as globals;

final GoRouter router = GoRouter(
  navigatorKey: globals.appNavigator,
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const SplashPage();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'SplashPage',
          builder: (BuildContext builderContext, GoRouterState state) =>
              Overlay(
            initialEntries: <OverlayEntry>[
              OverlayEntry(
                builder: (BuildContext context) => const AppLifecycleOverlay(
                  child: SplashPage(),
                ),
              )
            ],
          ),
        ),
        GoRoute(
          path: 'NavBottom',
          builder: (BuildContext context, GoRouterState state) {
            return const NavBottom();
          },
        ),
        /* GoRoute(
          path: 'Stadium3Page',
          builder: (BuildContext context, GoRouterState state) {
            return Stadium3Page(
              location: state.uri.queryParameters["location"].toString(),
            );
          },
        ), */
      ],
    ),
  ],
);
