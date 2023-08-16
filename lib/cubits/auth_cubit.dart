import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_handeling_apis/cubits/auth_states.dart';
import 'package:shop_app_handeling_apis/models/login_model.dart';
import 'package:shop_app_handeling_apis/shared/dio_helper.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitialState());
  bool isObscured = true;
  bool isLoading = false;
  LoginModel? loginModel;

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
        lang: 'ar',
      );
      loginModel = LoginModel.fromJSON(response.data);
      emit(LoginSuccessState(loginModel!));
    } catch (error) {
      emit(LoginErrorState(error.toString()));
    }
    isLoading = false;
    emit(LoadingState());
  }
}
