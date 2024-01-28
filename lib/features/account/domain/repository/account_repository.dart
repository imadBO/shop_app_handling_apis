import 'package:shop_app_handeling_apis/core/data_states.dart';
import 'package:shop_app_handeling_apis/features/account/domain/entities/profile_entity.dart';

abstract class AccountRepository {
  Future<DataState<ProfileEntity>> getProfile({required String token});
  Future<DataState<bool>> changePassword({
    required String token,
    required Map<String, String> pwds,
  });
}
