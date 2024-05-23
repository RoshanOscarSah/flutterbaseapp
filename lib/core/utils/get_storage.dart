import 'package:get_storage/get_storage.dart';

class GetSetStorage {
  final box = GetStorage();

  clear() {
    box.erase();
    return true;
  }

  //accesstoken
  setAccessToken(String accessToken) {
    box.write('accessToken', accessToken);
    return true;
  }

  getAccessToken() {
    var accessToken = box.read('accessToken');
    return accessToken ?? "";
  }

  //refreshToken
  setRefreshToken(String refreshToken) {
    box.write('refreshToken', refreshToken);
    return true;
  }

  getRefreshToken() {
    var refreshToken = box.read('refreshToken');
    return refreshToken ?? "";
  }

  
}
