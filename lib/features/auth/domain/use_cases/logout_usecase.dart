import 'package:shop_app_handeling_apis/core/data_states.dart';
import 'package:shop_app_handeling_apis/core/use_case/usecase.dart';
import 'package:shop_app_handeling_apis/features/auth/domain/entities/user_entity.dart';
import 'package:shop_app_handeling_apis/features/auth/domain/repository/auth_repository.dart';

class LogoutUsecase implements UseCase<DataState<UserEntity>, Map> {
  final AuthRepository _authRepository;
  LogoutUsecase(this._authRepository);
  @override
  Future<DataState<UserEntity>> call({Map params = const {}}) {
    return _authRepository.logout(userData: params);
  }
}
