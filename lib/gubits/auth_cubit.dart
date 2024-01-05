import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_handeling_apis/gubits/auth_states.dart';
import 'package:shop_app_handeling_apis/models/login_model.dart';
import 'package:shop_app_handeling_apis/models/logout_response.dart';
import 'package:shop_app_handeling_apis/shared/cached_helper.dart';
import 'package:shop_app_handeling_apis/shared/dio_helper.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitialState());
  bool isObscured = true;
  bool isLoading = false;
  LoginModel? loginModel;
  LogoutResponseModel? logoutResponseModel;

  static AuthCubit get(context) => BlocProvider.of(context);

  void changePasswordVisibility() {
    isObscured = !isObscured;
    emit(PasswordVisibilityState());
  }

  Future<void> login({required String email, required String password}) async {
    isLoading = true;
    emit(LoadingState());
    try {
      Response<dynamic> response = await DioHelper.post(
        endPoint: 'login',
        data: {'email': email, 'password': password},
        lang: 'en',
      );
      loginModel = LoginModel.fromJSON(response.data);
      emit(LoginSuccessState(loginModel!));
    } catch (error) {
      emit(LoginErrorState(error.toString()));
    }
    isLoading = false;
    emit(LoadingState());
  }

  Future<void> register({required Map userData}) async {
    isLoading = true;
    emit(LoadingState());
    try {
      Response<dynamic> response = await DioHelper.post(
        endPoint: 'register',
        data: userData,
        lang: 'en',
      );
      loginModel = LoginModel.fromJSON(response.data);
      isLoading = false;
      emit(LoadingState());
      emit(RegisterSuccessState(loginModel!));
    } catch (error) {
      isLoading = false;
      emit(LoadingState());
      emit(RegisterErrorState(error.toString()));
    }
  }

  Future<void> signOut({required String token}) async {
    isLoading = true;
    emit(LoadingState());
    try {
      Response<dynamic> response = await DioHelper.post(
        endPoint: 'logout',
        data: {"fcm_token": token},
        lang: 'en',
        token: token,
      );
      logoutResponseModel = LogoutResponseModel.fromJSON(response.data);
      await CachedHelper.deleteData('token');
      isLoading = false;
      emit(LoadingState());
      emit(LogoutSuccessState(logoutResponseModel!));
    } catch (error) {
      isLoading = false;
      emit(LoadingState());
      emit(LogoutErrorState(error.toString()));
    }
    
  }
}
