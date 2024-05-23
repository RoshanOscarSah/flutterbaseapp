import 'package:flutterbaseapp/feature/auth/data/models/login_model.dart';
import 'package:flutterbaseapp/core/network/api_endpoint.dart';
import 'package:flutterbaseapp/core/network/api_services.dart';
import 'package:flutter/foundation.dart';

class LoginRepository {
  Future<LoginModel> login(
    String phoneNumber,
    String token,
  ) async {
    try {
      var map = <String, dynamic>{};
      map['phoneNumber'] = phoneNumber;
      map['token'] = token;
      var response = await ApiServices().post(url: usersUrl, data: map);
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        final LoginModel result = LoginModel.fromMap(response.data);
        return result;
      } else {
        if (kDebugMode) {
          print(response);
        }
        throw response;
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
      rethrow;
    }
  }
}
