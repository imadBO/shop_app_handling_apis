import 'package:shop_app_handeling_apis/core/data_states.dart';
import 'package:shop_app_handeling_apis/core/use_case/usecase.dart';
import 'package:shop_app_handeling_apis/features/auth/domain/repository/auth_repository.dart';

class LogoutUsecase implements UseCase<DataState<bool>, String> {
  final AuthRepository _authRepository;
  LogoutUsecase(this._authRepository);
  @override
  Future<DataState<bool>> call({String params = ''}) {
    return _authRepository.logout(token: params);
  }
}
