import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_handeling_apis/core/data_states.dart';
import 'package:shop_app_handeling_apis/core/helpers/cached_helper.dart';
import 'package:shop_app_handeling_apis/core/resources/strings_manager.dart';
import 'package:shop_app_handeling_apis/features/auth/domain/use_cases/login_usecase.dart';
import 'package:shop_app_handeling_apis/features/auth/domain/use_cases/logout_usecase.dart';
import 'package:shop_app_handeling_apis/features/auth/domain/use_cases/signup_usecase.dart';
import 'package:shop_app_handeling_apis/features/auth/presentation/cubits/auth_states.dart';
import 'package:shop_app_handeling_apis/models/logout_response.dart';

class AuthCubit extends Cubit<AuthStates> {
  final LoginUsecase _loginUsecase;
  final SignupUsecase _signupUsecase;
  final LogoutUsecase _logoutUsecase;
  AuthCubit(this._loginUsecase, this._signupUsecase, this._logoutUsecase)
      : super(AuthInitialState());
  bool isObscured = true;
  bool isLoading = false;
  static bool isDark = CachedHelper.getData('isDark') ?? false;
  static bool showOnboarding = CachedHelper.getData('showOnboarding') ?? true;
  LogoutResponseModel? logoutResponseModel;

  static AuthCubit get(context) => BlocProvider.of(context);

  void changePasswordVisibility() {
    isObscured = !isObscured;
    emit(PasswordVisibilityState());
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    isLoading = true;
    emit(LoadingState());
    final response = await _loginUsecase.call(params: {
      'email': email,
      'password': password,
    });
    if (response is DataSuccess) {
      await CachedHelper.putData('token', response.data!.token);
      emit(LoginSuccessState(response.data!));
    } else {
      emit(LoginErrorState(response.error ?? StringsManager.defaultError));
    }
    isLoading = false;
    emit(LoadingState());
  }

  Future<void> register({required Map userData}) async {
    isLoading = true;
    emit(LoadingState());
    final response = await _signupUsecase.call(params: userData);
    if (response is DataSuccess) {
      await CachedHelper.putData('token', response.data!.token);
      isLoading = false;
      emit(LoadingState());
      emit(RegisterSuccessState(response.data!));
    } else {
      isLoading = false;
      emit(LoadingState());
      emit(RegisterErrorState(response.error ?? StringsManager.defaultError));
    }
  }

  Future<void> logout({required Map userData}) async {
    isLoading = true;
    emit(LoadingState());
    final response = await _logoutUsecase.call(params: userData);
    if (response is DataSuccess) {
      await CachedHelper.deleteData('token');
      isLoading = false;
      emit(LoadingState());
      emit(LogoutSuccessState(response.data!));
    } else {
      isLoading = false;
      emit(LoadingState());
      emit(LogoutErrorState(response.error ?? StringsManager.defaultError));
    }
  }

  void toggleMode() {
    isDark = !isDark;
    CachedHelper.putData("isDark", isDark);
    emit(ThemeChangedState());
  }
}
