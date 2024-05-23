enum Flavor {
  prod,
  test,
  dev,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.prod:
        return 'flutterbaseapp';
      case Flavor.test:
        return 'flutterbaseapp Test';
      case Flavor.dev:
        return 'flutterbaseapp Dev';
      default:
        return 'title';
    }
  }

}
