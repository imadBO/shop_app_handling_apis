import 'package:shop_app_handeling_apis/core/data_states.dart';
import 'package:shop_app_handeling_apis/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<DataState<UserEntity>> login({
    required String email,
    required String password,
  });
  Future<DataState<UserEntity>> register({required Map userData});
  Future<DataState<UserEntity>> logout({required Map userData});
}
