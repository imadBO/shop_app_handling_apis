import 'package:get_it/get_it.dart';
import 'package:shop_app_handeling_apis/features/auth/data/data_sources/remote/auth_services.dart';
import 'package:shop_app_handeling_apis/features/auth/data/repository/auth_repository_impl.dart';
import 'package:shop_app_handeling_apis/features/auth/domain/repository/auth_repository.dart';
import 'package:shop_app_handeling_apis/features/auth/domain/use_cases/login_usecase.dart';
import 'package:shop_app_handeling_apis/features/auth/domain/use_cases/logout_usecase.dart';
import 'package:shop_app_handeling_apis/features/auth/domain/use_cases/signup_usecase.dart';
import 'package:shop_app_handeling_apis/features/auth/presentation/cubits/auth_cubit.dart';

final authSl = GetIt.instance;
final _loginSl = GetIt.instance;
final _logoutSl = GetIt.instance;
final _signupSl = GetIt.instance;

Future<void> initDependencies() async {
  authSl.registerSingleton<AuthService>(AuthService());
  authSl.registerSingleton<AuthRepository>(AuthRepositoryImpl(authSl()));
  _loginSl.registerSingleton<LoginUsecase>(LoginUsecase(authSl()));
  _signupSl.registerSingleton<SignupUsecase>(SignupUsecase(authSl()));
  _logoutSl.registerSingleton<LogoutUsecase>(LogoutUsecase(authSl()));
  authSl.registerSingleton<AuthCubit>(
    AuthCubit(_loginSl(), _signupSl(), _logoutSl()),
  );
}
