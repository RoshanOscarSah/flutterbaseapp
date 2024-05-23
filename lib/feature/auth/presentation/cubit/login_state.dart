part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {
  LoginLoading();
}

final class LoginOtpSuccess extends LoginState {
  final bool otpSent;
  LoginOtpSuccess(this.otpSent);
}

final class LoginSuccess extends LoginState {
  final LoginModel loginModel;
  LoginSuccess(this.loginModel);
}

final class LoginError extends LoginState {
  final String message;
  LoginError(this.message);
}

final class LoginOTPError extends LoginState {
  final String message;
  LoginOTPError(this.message);
}
