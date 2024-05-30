import 'dart:io';

import 'package:feedback/feedback.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutterbaseapp/feature/auth/data/repository/login_repository.dart';
import 'package:flutterbaseapp/feature/auth/presentation/cubit/login_cubit.dart';
import 'package:flutterbaseapp/firebase/dev/firebase_options.dart' as dev;
import 'package:flutterbaseapp/firebase/prod/firebase_options.dart' as prod;
import 'package:flutterbaseapp/firebase/stg/firebase_options.dart' as stg;
import 'package:get_storage/get_storage.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:upgrader/upgrader.dart';

import 'package:flutterbaseapp/core/config/color.dart';
import 'package:flutterbaseapp/core/config/text_style.dart';
import 'package:flutterbaseapp/core/navigation/go_router.dart';
import 'package:flutterbaseapp/core/utils/globals.dart' as globals;
import 'package:flutterbaseapp/flavors.dart';

void main() async {
  globals.appNavigator = GlobalKey<NavigatorState>();
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  if (F.appFlavor == Flavor.prod) {
    await Firebase.initializeApp(
      name: "panda-prod-app-e2216",
      options: prod.DefaultFirebaseOptions.currentPlatform,
    );
  } else if (F.appFlavor == Flavor.stg) {
    await Firebase.initializeApp(
      name: "panda-stg-app-21124",
      options: stg.DefaultFirebaseOptions.currentPlatform,
    );
  } else if (F.appFlavor == Flavor.dev) {
    await Firebase.initializeApp(
      name: "panda-dev-app-12111",
      options: dev.DefaultFirebaseOptions.currentPlatform,
    );
  }

  await dotenv.load(fileName: ".env");
  await GetStorage.init();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getApplicationDocumentsDirectory(),
  );

  const fatalError = true;
  // Non-async exceptions
  FlutterError.onError = (errorDetails) {
    if (fatalError) {
      // If you want to record a "fatal" exception
      FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
      // ignore: dead_code
    } else {
      // If you want to record a "non-fatal" exception
      FirebaseCrashlytics.instance.recordFlutterError(errorDetails);
    }
  };
  // Async exceptions
  PlatformDispatcher.instance.onError = (error, stack) {
    if (fatalError) {
      // If you want to record a "fatal" exception
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      // ignore: dead_code
    } else {
      // If you want to record a "non-fatal" exception
      FirebaseCrashlytics.instance.recordError(error, stack);
    }
    return true;
  };
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Remove this method to stop OneSignal Debugging
    OneSignal.Debug.setLogLevel(OSLogLevel.verbose);

    OneSignal.initialize(F.onesignalId);

    // The promptForPushNotificationsWithUserResponse function will show the iOS or Android push notification prompt. We recommend removing the following code and instead using an In-App Message to prompt for notification permission
    OneSignal.Notifications.requestPermission(true);

    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginCubit>(
            create: (context) => LoginCubit(LoginRepository())),
      ],
      child: BlocBuilder<LoginCubit, LoginState>(
        builder: (context, state) {
          return BetterFeedback(
            theme: FeedbackThemeData(
              activeFeedbackModeColor: kY100,
              bottomSheetDescriptionStyle: smSemibold(color: kE100),
              background: kR200,
            ),
            child: ResponsiveSizer(
              builder: (context, orientation, screenType) {
                return UpgradeAlert(
                  dialogStyle: Platform.isIOS
                      ? UpgradeDialogStyle.cupertino
                      : UpgradeDialogStyle.material,
                  barrierDismissible: true,
                  child: MaterialApp.router(
                    debugShowCheckedModeBanner: false,
                    title: F.title,
                    localizationsDelegates:
                        AppLocalizations.localizationsDelegates,
                    supportedLocales: AppLocalizations.supportedLocales,
                    routerConfig: router,
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
