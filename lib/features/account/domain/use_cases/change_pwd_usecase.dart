import 'package:shop_app_handeling_apis/core/data_states.dart';
import 'package:shop_app_handeling_apis/core/use_case/usecase.dart';
import 'package:shop_app_handeling_apis/features/account/domain/repository/account_repository.dart';

class ChangePwdUsecase
    implements UseCase<DataState<bool>, Map<String, dynamic>> {
  final AccountRepository _accountRepository;

  ChangePwdUsecase(this._accountRepository);
  @override
  Future<DataState<bool>> call({params = const {}}) async {
    return _accountRepository.changePassword(
      token: params['token'],
      pwds: params['pwds']!,
    );
  }
}
