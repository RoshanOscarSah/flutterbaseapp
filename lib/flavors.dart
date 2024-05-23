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

}
