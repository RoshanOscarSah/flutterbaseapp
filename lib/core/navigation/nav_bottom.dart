import 'package:flutterbaseapp/feature/notification/presentation/views/notification_page.dart';
import 'package:flutterbaseapp/feature/splash/presentation/views/splash_page.dart';
import 'package:flutterbaseapp/core/config/color.dart';
import 'package:flutterbaseapp/core/config/page_navigation_const.dart';
import 'package:flutterbaseapp/core/config/text_style.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class NavBottom extends StatefulWidget {
  const NavBottom({super.key});

  @override
  State<NavBottom> createState() => _NavBottomState();
}

class _NavBottomState extends State<NavBottom> {
  late PersistentTabController _controller;

  @override
  void initState() {
    super.initState();

    _controller = PersistentTabController(initialIndex: 0);
  }

  List<PersistentTabConfig> get _tab {
    return [
      PersistentTabConfig(
        screen: const SplashPage(),
        item: ItemConfig(
          icon: const Icon(Icons.home),
          title: ("Home"),
          textStyle: smRegular(color: kWhite, fontFamily: 'changa_one'),
          activeForegroundColor: kWhite,
          inactiveForegroundColor: kP700,
        ),
      ),
      PersistentTabConfig(
        screen: const SplashPage(),
        item: ItemConfig(
          icon: const Icon(Icons.confirmation_num),
          title: ("My Tickets"),
          textStyle: smRegular(color: kWhite, fontFamily: 'changa_one'),
          activeForegroundColor: kWhite,
          inactiveForegroundColor: kP700,
        ),
      ),
      PersistentTabConfig(
        screen: const NotificationPage(),
        item: ItemConfig(
          icon: const Badge(
            label: Text('2'),
            backgroundColor: kR200,
            child: Icon(Icons.favorite),
          ),
          title: ("Favourite"),
          textStyle: smRegular(color: kWhite, fontFamily: 'changa_one'),
          activeForegroundColor: kWhite,
          inactiveForegroundColor: kP700,
        ),
      ),
      PersistentTabConfig(
        screen: const NotificationPage(),
        item: ItemConfig(
          icon: const Icon(Icons.account_circle),
          title: ("Profile"),
          textStyle: smRegular(color: kWhite, fontFamily: 'changa_one'),
          activeForegroundColor: kWhite,
          inactiveForegroundColor: kP700,
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      controller: _controller,
      tabs: _tab,
      avoidBottomPadding: true,
      backgroundColor: kP150,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      screenTransitionAnimation: const ScreenTransitionAnimation(
        curve: Curves.ease,
        duration: duration200,
      ),
      navBarBuilder: (navBarConfig) => Style6BottomNavBar(
        navBarConfig: navBarConfig,
        navBarDecoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.transparent,
        ),
      ),
    );
  }
}
