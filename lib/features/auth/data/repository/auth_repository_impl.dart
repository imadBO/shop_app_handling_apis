import 'package:shop_app_handeling_apis/core/data_states.dart';
import 'package:shop_app_handeling_apis/features/auth/data/data_sources/remote/auth_services.dart';
import 'package:shop_app_handeling_apis/features/auth/data/models/user_model.dart';
import 'package:shop_app_handeling_apis/features/auth/domain/entities/user_entity.dart';
import 'package:shop_app_handeling_apis/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthService _authService;
  AuthRepositoryImpl(this._authService);
  @override
  Future<DataState<UserEntity>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _authService.login(
        email: email,
        password: password,
      );
      if (response.data['status'] == true) {
        return DataSuccess(UserModel.fromJSON(response.data['data']));
      } else {
        return DataFailure(response.data['message']);
      }
    } catch (error) {
      return DataFailure(error.toString());
    }
  }

  @override
  Future<DataState<UserEntity>> logout({required Map userData}) async {
    try {
      final response = await _authService.logout(token: userData['token']);
      if (response.data['status'] == true) {
        return DataSuccess(UserModel.fromJSON(userData['data']));
      } else {
        return DataFailure(response.data['message']);
      }
    } catch (error) {
      return DataFailure(error.toString());
    }
  }

  @override
  Future<DataState<UserEntity>> register({required Map userData}) async {
    try {
      final response = await _authService.register(userData: userData);
      if (response.data['status'] == true) {
        return DataSuccess(UserModel.fromJSON(response.data['data']));
      } else {
        return DataFailure(response.data['message']);
      }
    } catch (error) {
      return DataFailure(error.toString());
    }
  }
}
