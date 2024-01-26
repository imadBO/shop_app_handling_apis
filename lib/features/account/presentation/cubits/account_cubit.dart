import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_handeling_apis/core/data_states.dart';
import 'package:shop_app_handeling_apis/core/helpers/cached_helper.dart';
import 'package:shop_app_handeling_apis/features/account/domain/entities/profile_entity.dart';
import 'package:shop_app_handeling_apis/features/account/domain/use_cases/get_profile_usecase.dart';
import 'package:shop_app_handeling_apis/features/account/presentation/cubits/account_states.dart';

class AccountCubit extends Cubit<AccountStates> {
  AccountCubit(this._getProfileUsecase) : super(AccountInitialState());
  static AccountCubit get(context) => BlocProvider.of(context);
  final GetProfileUsecase _getProfileUsecase;
  bool profileLoading = false;
  ProfileEntity? profile;

  Future<void> getProfile() async {
    profileLoading = true;
    emit(ProfileLoadingState());
    final response = await _getProfileUsecase.call(
      params: CachedHelper.getData('token'),
    );

    if (response is DataSuccess) {
      profile = response.data!;
      emit(ProfileFetchedSuccessState());
    } else {
      if (response is DataFailureDio) {
        emit(ProfileFetchedErrorState(response.error.toString()));
      }
      emit(ProfileFetchedErrorState(response.error!));
    }
    profileLoading = false;
    emit(ProfileLoadingState());
  }
}
