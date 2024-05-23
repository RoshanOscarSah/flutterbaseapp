import 'package:permission_handler/permission_handler.dart';

class AppPermission {
  bool permiss = false;
  checkLocation() async {
    await Permission.location.onDeniedCallback(() {
      permiss = false;
    }).onGrantedCallback(() {
      permiss = true;
    }).onPermanentlyDeniedCallback(() {
      permiss = false;
    }).onRestrictedCallback(() {
      permiss = false;
    }).onLimitedCallback(() {
      permiss = false;
    }).onProvisionalCallback(() {
      permiss = true;
    }).request();
    return permiss;
  }
}
