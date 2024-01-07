import 'package:shop_app_handeling_apis/core/data_states.dart';
import 'package:shop_app_handeling_apis/core/use_case/usecase.dart';
import 'package:shop_app_handeling_apis/features/home/domain/entities/home_data_entity.dart';
import 'package:shop_app_handeling_apis/features/home/domain/repository/home_repository.dart';

class HomeDataUsecase implements UseCase<DataState<HomeDataEntity>, String> {
  final HomeRepository _homeRepository;
  HomeDataUsecase(this._homeRepository);
  @override
  Future<DataState<HomeDataEntity>> call({params = ''}) {
    return _homeRepository.fetchHomeData(token: params);
  }
}
