import 'package:dio/dio.dart';
import 'package:shop_app_handeling_apis/core/data_states.dart';
import 'package:shop_app_handeling_apis/features/account/data/data_sources/remote/account_service.dart';
import 'package:shop_app_handeling_apis/features/account/data/models/profile_model.dart';
import 'package:shop_app_handeling_apis/features/account/domain/entities/profile_entity.dart';
import 'package:shop_app_handeling_apis/features/account/domain/repository/account_repository.dart';

class AccountRepositoryImpl implements AccountRepository {
  final AccountService _accountService;
  AccountRepositoryImpl(this._accountService);
  @override
  Future<DataState<ProfileEntity>> getProfile({required String token}) async {
    try {
      final response = await _accountService.getProfile(token: token);
      if (response.data['status'] == true) {
        return DataSuccess(ProfileModel.fromJSON(response.data['data']));
      } else {
        return DataFailure(response.data['message']);
      }
    } catch (error) {
      if (error is DioException) {
        return DataFailureDio(error);
      }
      return DataFailure(error.toString());
    }
  }
}
