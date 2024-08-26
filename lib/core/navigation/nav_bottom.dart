import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutterbaseapp/feature/auth/presentation/views/login_page.dart';
import 'package:flutterbaseapp/feature/notification/presentation/views/notification_page.dart';
import 'package:flutterbaseapp/feature/splash/presentation/views/splash_page.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:flutterbaseapp/core/config/color.dart';
import 'package:flutterbaseapp/core/config/constant.dart';
import 'package:flutterbaseapp/core/config/duration_transition.dart';

class NavBottom extends StatefulWidget {
  const NavBottom({super.key});

  @override
  State<NavBottom> createState() => _NavBottomState();
}

class _NavBottomState extends State<NavBottom> {
  late PersistentTabController _controller;
  bool hideNavigationBar = false;

  @override
  void initState() {
    super.initState();

    _controller = PersistentTabController(initialIndex: 0);
  }

  List<PersistentTabConfig> get _tab {
    return [
      PersistentTabConfig(
        screen: const LoginPage(),
        item: ItemConfig(
          icon: const Icon(Icons.home),
          inactiveIcon: const Icon(Icons.home_outlined),
          activeForegroundColor: CusColor.kWhite,
        ),
      ),
      PersistentTabConfig(
        screen: const LoginPage(),
        item: ItemConfig(
          icon: const Icon(Icons.compass_calibration),
          inactiveIcon: const Icon(Icons.compass_calibration_outlined),
          activeForegroundColor: CusColor.kWhite,
        ),
      ),
      PersistentTabConfig(
        screen: const NotificationPage(),
        item: ItemConfig(
          icon: const Icon(Icons.notifications_active),
          inactiveIcon: const Icon(Icons.notifications_active_outlined),
          activeForegroundColor: CusColor.kWhite,
        ),
      ),
      PersistentTabConfig(
        screen: const NotificationPage(),
        item: ItemConfig(
          icon: const Icon(Icons.settings),
          inactiveIcon: const Icon(Icons.settings_outlined),
          activeForegroundColor: Colors.black,
          activeColorSecondary: CusColor.kWhite,
        ),
      ),
    ];
  }

  void toggleNavBarVisibility(bool hide) {
    setState(() {
      hideNavigationBar = hide;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      navBarHeight: 55,
      controller: _controller,
      tabs: _tab,
      hideNavigationBar: hideNavigationBar,
      avoidBottomPadding: true,
      backgroundColor: CusColor.kWhite,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      screenTransitionAnimation: const ScreenTransitionAnimation(
        curve: Curves.ease,
        duration: duration200,
      ),
      navBarBuilder: (navBarConfig) => Style11BottomNavBar(
        navBarConfig: navBarConfig,
        navBarDecoration: NavBarDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.21),
              spreadRadius: 0,
              blurRadius: 2,
              offset: const Offset(4, 0), // changes position of shadow
            ),
          ],
          color: CusColor.kWhite,
        ),
      ),
    );
  }
}
