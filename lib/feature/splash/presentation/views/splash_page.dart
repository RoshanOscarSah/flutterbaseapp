import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutterbaseapp/feature/notification/presentation/views/notification_page.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:go_router/go_router.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/config/color.dart';
import '../../../../core/config/constant.dart';
import '../../../../core/config/page_navigation_const.dart';
import '../../../../core/config/text_style.dart';
import '../../../../core/network/api_endpoint.dart';
import '../../../../core/utils/get_storage.dart';
import '../../../../core/utils/globals.dart' as globals;
import '../../../../core/widget/image_builder.dart';
import '../../../../core/widget/loading_animation.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool _loading = false;
  final bool _kTestingCrashlytics = true;
  @override
  void initState() {
    FlutterNativeSplash.remove(); // stop splash
    debugPrint(baseUrl);
    FirebaseCrashlytics.instance.log("SplashPage");
    _initializeFlutterFire();

    Future.delayed(duration200).then((value) {
      setState(() {
        _loading = true;
      });
      var token = GetSetStorage().getAccessToken();
      if (token == "") {
        Future.delayed(duration200).then(
            (value) => context.pushReplacement('/LanguagePage', extra: false));
      } else {
        Future.delayed(duration200).then((value) {
          context.pushReplacement('/NavBottom');

          //if notification is clicked
          OneSignal.Notifications.addClickListener((event) {
            globals.appNavigator.currentState?.push(
              MaterialPageRoute(
                builder: (context) => const NotificationPage(),
              ),
            );
          });
        });
      }
    });

    super.initState();
  }

  // Define an async function to initialize FlutterFire
  Future<void> _initializeFlutterFire() async {
    if (_kTestingCrashlytics) {
      // Force enable crashlytics collection enabled if we're testing it.
      await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
    } else {
      // Else only enable it in non-debug builds.
      // You could additionally extend this to allow users to opt-in.
      await FirebaseCrashlytics.instance
          .setCrashlyticsCollectionEnabled(!kDebugMode);
    }

    //setting key in FirebaseCrashlytics
    String number = "User id";
    FirebaseCrashlytics.instance.setUserIdentifier(number);
    FirebaseCrashlytics.instance.setCustomKey('user', number);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kP100,
      body: Center(
        child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 5.h),
              child: Column(
                children: [
                  const ImageBuilder(
                    width: 120,
                    height: 120,
                    fit: BoxFit.cover,
                    imageUrl: kAImLogo,
                  ),
                  Text(
                    "App Name",
                    style: xxlSemibold(color: kY100),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
            _loading
                ? Positioned(
                    bottom: 0,
                    child: SizedBox(
                      height: 36.h,
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView(
                          reverse: true,
                          padding: EdgeInsets.symmetric(
                              horizontal: 1.w, vertical: 3.h),
                          children: [
                            Text(
                              "App slogon",
                              style: lgSemibold(color: kWhite),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                : const SizedBox(),
            _loading
                ? const Positioned(
                    bottom: 30,
                    right: 30,
                    child: LoadingHexa(),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}

/* flutterfire config \
  --project=cylindev \
  --out=lib/firebase_options_dev.dart \
  --ios-bundle-id=com.eachut.cylin.dev \
  --macos-bundle-id=com.eachut.cylin.dev \
  --android-app-id=com.eachut.cylin.dev */
