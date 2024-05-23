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
        return dotenv.env['CYLIN_DEV_URL'].toString();
      case Flavor.stg:
        return dotenv.env['CYLIN_STG_URL'].toString();
      case Flavor.prod:
        return dotenv.env['CYLIN_PROD_URL'].toString();
      default:
        return dotenv.env['CYLIN_DEV_URL'].toString();
    }
  }

  static String get onesignalId {
    switch (appFlavor) {
      case Flavor.dev:
        return dotenv.env['CYLIN_DEV_ONESIGNAL_APP_ID'].toString();
      case Flavor.stg:
        return dotenv.env['CYLIN_STG_ONESIGNAL_APP_ID'].toString();
      case Flavor.prod:
        return dotenv.env['CYLIN_PROD_ONESIGNAL_APP_ID'].toString();
      default:
        return dotenv.env['CYLIN_DEV_ONESIGNAL_APP_ID'].toString();
    }
  }
}
