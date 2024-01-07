import 'package:shop_app_handeling_apis/core/data_states.dart';
import 'package:shop_app_handeling_apis/core/use_case/usecase.dart';
import 'package:shop_app_handeling_apis/features/home/domain/repository/home_repository.dart';

class ToggleFavoriteUsecase implements UseCase<DataState<bool>, Map> {
  final HomeRepository _homeRepository;
  ToggleFavoriteUsecase(this._homeRepository);
  @override
  Future<DataState<bool>> call({params = const {}}) {
    return _homeRepository.toggleFavorite(
      productId: params['productId'],
      token: params['token'],
    );
  }
}
