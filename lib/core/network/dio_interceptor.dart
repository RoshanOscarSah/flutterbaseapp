import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

import 'package:flutterbaseapp/feature/splash/presentation/views/splash_page.dart';

import '../network/api_endpoint.dart';
import '../network/auth_model.dart';
import '../utils/get_storage.dart';
import '../utils/globals.dart' as globals;

class DioInterceptor extends Interceptor {
  Future<void> tokenCheck() async {
    late final Dio dio;

    final String? accessToken = GetSetStorage().getAccessToken();
    final String? refreshToken = GetSetStorage().getRefreshToken();
    if (accessToken!.isNotEmpty && refreshToken!.isNotEmpty) {
      bool accessTokenExpired = JwtDecoder.isExpired(accessToken);
      bool refreshTokenExpired = JwtDecoder.isExpired(refreshToken);

      if (refreshTokenExpired) {
        await logout();
      }

      if (accessTokenExpired) {
        try {
          dio = Dio();
          final response = await dio.post(
            jwtRefreshUrl,
            data: {
              "refToken": refreshToken,
            },
          );

          if (response.statusCode! >= 200 && response.statusCode! < 300) {
            final AuthModel result = AuthModel.fromMap(response.data);

            GetSetStorage().setAccessToken(result.authToken);
            GetSetStorage().setRefreshToken(result.refToken);
          } else {
            await logout();
          }
        } catch (e) {
          if (kDebugMode) {
            print(e);
          }
        }
      }
    }
  }

  Future<void> logout() async {
    await OneSignal.logout();
    await GetSetStorage().clear();
    globals.appNavigator.currentState?.push(
      MaterialPageRoute(builder: (BuildContext context) => const SplashPage()),
    );
  }

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    String? accessToken = await GetSetStorage().getAccessToken();

    if (accessToken!.isNotEmpty) {
      await tokenCheck();
      accessToken = await GetSetStorage().getAccessToken();
      options.headers['Authorization'] = 'Bearer $accessToken';
    }
    options.headers['Content-Type'] = 'application/json';
    options.followRedirects = false;
    options.validateStatus = (status) => true;

    super.onRequest((options), handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    if (response.statusCode.toString() == "401") {
      await logout();
    }

    super.onResponse(response, handler);
  }

  /*  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    super.onError((err..message), handler);
  } */
}
