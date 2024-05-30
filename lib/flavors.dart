import 'package:flutter_dotenv/flutter_dotenv.dart';

enum Flavor {
  dev,
  stg,
  prod,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.dev:
        return 'flutterbaseapp Dev';
      case Flavor.stg:
        return 'flutterbaseapp Test';
      case Flavor.prod:
        return 'flutterbaseapp';
      default:
        return 'title';
    }
  }

  static String get baseUrl {
    switch (appFlavor) {
      case Flavor.dev:
        return dotenv.env['DEV_BASE_URL'].toString();
      case Flavor.stg:
        return dotenv.env['STG_BASE_URL'].toString();
      case Flavor.prod:
        return dotenv.env['PROD_PROD_URL'].toString();
      default:
        return "url";
    }
  }

  static String get onesignalId {
    switch (appFlavor) {
      case Flavor.dev:
        return dotenv.env['DEV_ONESIGNAL_APP_ID'].toString();
      case Flavor.stg:
        return dotenv.env['STG_ONESIGNAL_APP_ID'].toString();
      case Flavor.prod:
        return dotenv.env['PROD_ONESIGNAL_APP_ID'].toString();
      default:
        return "onesignal";
    }
  }
}
