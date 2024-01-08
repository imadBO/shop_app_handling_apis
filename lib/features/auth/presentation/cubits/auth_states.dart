import 'package:shop_app_handeling_apis/features/auth/domain/entities/user_entity.dart';

abstract class AuthStates {}

class AuthInitialState extends AuthStates {}

class PasswordVisibilityState extends AuthStates {}

class LoadingState extends AuthStates {}

class LoginSuccessState extends AuthStates {
  LoginSuccessState(this.userEntity);
  final UserEntity userEntity;
}

class LoginErrorState extends AuthStates {
  LoginErrorState(this.error);
  final String error;
}

class RegisterSuccessState extends AuthStates {
  RegisterSuccessState(this.userEntity);
  final UserEntity userEntity;
}

class RegisterErrorState extends AuthStates {
  RegisterErrorState(this.error);
  final String error;
}

class LogoutSuccessState extends AuthStates {
  LogoutSuccessState(this.userEntity);
  final UserEntity userEntity;
}

class LogoutErrorState extends AuthStates {
  LogoutErrorState(this.error);
  final String error;
}

class ThemeChangedState extends AuthStates{}
