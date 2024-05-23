import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutterbaseapp/core/network/check_connectivity.dart';
import 'package:flutterbaseapp/feature/auth/data/models/login_model.dart';
import 'package:flutterbaseapp/feature/auth/data/repository/login_repository.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepository _repository;
  LoginCubit(this._repository) : super(LoginInitial());

  Future<void> login(
      {required String phoneNumber, required String token}) async {
    if (await checkConnectivity()) {
      emit(LoginLoading());
      try {
        final response = await _repository.login(phoneNumber, token);
        emit(LoginSuccess(response));
      } catch (e) {
        emit(LoginOTPError(e.toString()));
      }
    }
  }
}
