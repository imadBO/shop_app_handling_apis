import 'package:shop_app_handeling_apis/core/data_states.dart';
import 'package:shop_app_handeling_apis/core/use_case/usecase.dart';
import 'package:shop_app_handeling_apis/features/home/domain/entities/category_entity.dart';
import 'package:shop_app_handeling_apis/features/home/domain/repository/home_repository.dart';

class CategoriesUsecase
    implements UseCase<DataState<List<CategoryEntity>>, String> {
  final HomeRepository _homeRepository;
  CategoriesUsecase(this._homeRepository);

  @override
  Future<DataState<List<CategoryEntity>>> call({params = ""}) {
    return _homeRepository.fetchCategories();
  }
}
