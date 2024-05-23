import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import 'package:flutterbaseapp/feature/splash/presentation/views/splash_page.dart';

import '../config/color.dart';
import '../config/page_navigation_const.dart';
import '../config/text_style.dart';

class NavBottom extends StatefulWidget {
  const NavBottom({super.key});

  @override
  State<NavBottom> createState() => _NavBottomState();
}

class _NavBottomState extends State<NavBottom> {
  late PersistentTabController _controller;

  List<Widget> _buildScreens() {
    return [
      const SplashPage(),
      const SplashPage(),
      const SplashPage(),
      const SplashPage()
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        title: ("Home"),
        textStyle: smRegular(color: kWhite, fontFamily: 'changa_one'),
        activeColorPrimary: kWhite,
        inactiveColorPrimary: kP700,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.confirmation_num),
        title: ("My Tickets"),
        textStyle: smRegular(color: kWhite, fontFamily: 'changa_one'),
        activeColorPrimary: kWhite,
        inactiveColorPrimary: kP700,
      ),
      PersistentBottomNavBarItem(
        icon: const Badge(
          label: Text('2'),
          backgroundColor: kR200,
          child: Icon(Icons.favorite),
        ),
        title: ("Favourite"),
        textStyle: smRegular(color: kWhite, fontFamily: 'changa_one'),
        activeColorPrimary: kWhite,
        inactiveColorPrimary: kP700,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.account_circle),
        title: ("Profile"),
        textStyle: smRegular(color: kWhite, fontFamily: 'changa_one'),
        activeColorPrimary: kWhite,
        inactiveColorPrimary: kP700,
      ),
    ];
  }

  @override
  void initState() {
    super.initState();

    _controller = PersistentTabController(initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: kP150, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.transparent,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: duration200,
        curve: curveEase,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: duration200,
      ),
      navBarStyle:
          NavBarStyle.style6, // Choose the nav bar style with this property.
    );
  }
}
