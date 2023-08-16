import 'package:shop_app_handeling_apis/models/login_model.dart';

abstract class AuthStates {}

class AuthInitialState extends AuthStates {}

class PasswordVisibilityState extends AuthStates {}

class LoadingState extends AuthStates{}

class LoginSuccessState extends AuthStates {
  LoginSuccessState(this.loginModel);
  final LoginModel loginModel;
}

class LoginErrorState extends AuthStates {
  LoginErrorState(this.error);
  final String error;
}

