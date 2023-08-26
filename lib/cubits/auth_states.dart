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

class RegisterSuccessState extends AuthStates {
  RegisterSuccessState(this.loginModel);
  final LoginModel loginModel;
}

class RegisterErrorState extends AuthStates {
  RegisterErrorState(this.error);
  final String error;
}

