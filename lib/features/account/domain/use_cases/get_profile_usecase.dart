import 'package:shop_app_handeling_apis/core/data_states.dart';
import 'package:shop_app_handeling_apis/core/use_case/usecase.dart';
import 'package:shop_app_handeling_apis/features/account/domain/entities/profile_entity.dart';
import 'package:shop_app_handeling_apis/features/account/domain/repository/account_repository.dart';

class GetProfileUsecase implements UseCase<DataState<ProfileEntity>, String> {
  final AccountRepository _accountRepository;

  GetProfileUsecase(this._accountRepository);
  @override
  Future<DataState<ProfileEntity>> call({String params = ''}) async {
    return _accountRepository.getProfile(token: params);
  }
}
