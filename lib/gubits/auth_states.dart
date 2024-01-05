import 'package:shop_app_handeling_apis/models/login_model.dart';
import 'package:shop_app_handeling_apis/models/logout_response.dart';

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

class LogoutSuccessState extends AuthStates {
  LogoutSuccessState(this.logoutResponseModel);
  final LogoutResponseModel logoutResponseModel;
}

class LogoutErrorState extends AuthStates {
  LogoutErrorState(this.error);
  final String error;
}

