import 'package:get_it/get_it.dart';
import 'package:shop_app_handeling_apis/features/auth/data/data_sources/remote/auth_services.dart';
import 'package:shop_app_handeling_apis/features/auth/data/repository/auth_repository_impl.dart';
import 'package:shop_app_handeling_apis/features/auth/domain/repository/auth_repository.dart';
import 'package:shop_app_handeling_apis/features/auth/domain/use_cases/login_usecase.dart';
import 'package:shop_app_handeling_apis/features/auth/domain/use_cases/logout_usecase.dart';
import 'package:shop_app_handeling_apis/features/auth/domain/use_cases/signup_usecase.dart';
import 'package:shop_app_handeling_apis/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:shop_app_handeling_apis/features/cart/data/data_sources/remote/cart_service.dart';
import 'package:shop_app_handeling_apis/features/cart/data/repository/cart_repository_impl.dart';
import 'package:shop_app_handeling_apis/features/cart/domain/repository/cart_repository.dart';
import 'package:shop_app_handeling_apis/features/cart/domain/use_cases/add_remove_cart_usecase.dart';
import 'package:shop_app_handeling_apis/features/cart/domain/use_cases/get_carts_usecase.dart';
import 'package:shop_app_handeling_apis/features/cart/domain/use_cases/update_cart_usecase.dart';
import 'package:shop_app_handeling_apis/features/cart/presentation/cubits/cart_cubit.dart';
import 'package:shop_app_handeling_apis/features/home/data/data_sources/remote/home_service.dart';
import 'package:shop_app_handeling_apis/features/home/data/repository/home_repository_impl.dart';
import 'package:shop_app_handeling_apis/features/home/domain/repository/home_repository.dart';
import 'package:shop_app_handeling_apis/features/home/domain/use_cases/categories_usecase.dart';
import 'package:shop_app_handeling_apis/features/home/domain/use_cases/fetch_favorites_usecase.dart';
import 'package:shop_app_handeling_apis/features/home/domain/use_cases/home_data_usecase.dart';
import 'package:shop_app_handeling_apis/features/home/domain/use_cases/toggle_favorite_usecase.dart';
import 'package:shop_app_handeling_apis/features/home/presentation/cubits/home_cubit.dart';
import 'package:shop_app_handeling_apis/features/search/data/data_sources/remote/search_service.dart';
import 'package:shop_app_handeling_apis/features/search/data/repository/search_repository_impl.dart';
import 'package:shop_app_handeling_apis/features/search/domain/repository/search_repository.dart';
import 'package:shop_app_handeling_apis/features/search/domain/use_cases/search_usecase.dart';
import 'package:shop_app_handeling_apis/features/search/presentation/cubits/search_cubit.dart';

final authSl = GetIt.instance;
final _loginSl = GetIt.instance;
final _logoutSl = GetIt.instance;
final _signupSl = GetIt.instance;
final searchSl = GetIt.instance;
final homeSl = GetIt.instance;
final _homeDataSl = GetIt.instance;
final _toggleFavoriteSl = GetIt.instance;
final _categoriesSl = GetIt.instance;
final _fetchFavoritesSl = GetIt.instance;
final cartSl = GetIt.instance;
final _getCartsSl = GetIt.instance;
final _updateCartSl = GetIt.instance;
final _addRemoveCartSl = GetIt.instance;
Future<void> initDependencies() async {
  authSl.registerSingleton<AuthService>(AuthService());
  authSl.registerSingleton<AuthRepository>(AuthRepositoryImpl(authSl()));
  _loginSl.registerSingleton<LoginUsecase>(LoginUsecase(authSl()));
  _signupSl.registerSingleton<SignupUsecase>(SignupUsecase(authSl()));
  _logoutSl.registerSingleton<LogoutUsecase>(LogoutUsecase(authSl()));
  authSl.registerSingleton<AuthCubit>(
    AuthCubit(_loginSl(), _signupSl(), _logoutSl()),
  );

  // Search.
  searchSl.registerSingleton<SearchService>(SearchService());
  searchSl.registerSingleton<SearchRepository>(
    SearchRepositoryImpl(searchSl()),
  );
  searchSl.registerSingleton<SearchUsecase>(SearchUsecase(searchSl()));
  searchSl.registerSingleton<SearchCubit>(SearchCubit(searchSl()));

  // Home.
  homeSl.registerSingleton<HomeService>(HomeService());
  homeSl.registerSingleton<HomeRepository>(HomeRepositoryImpl(homeSl()));
  _homeDataSl.registerSingleton<HomeDataUsecase>(HomeDataUsecase(homeSl()));
  _toggleFavoriteSl.registerSingleton<ToggleFavoriteUsecase>(
    ToggleFavoriteUsecase(homeSl()),
  );
  _categoriesSl.registerSingleton<CategoriesUsecase>(
    CategoriesUsecase(homeSl()),
  );
  _fetchFavoritesSl.registerSingleton<FetchFavoritesUsecase>(
    FetchFavoritesUsecase(homeSl()),
  );
  homeSl.registerSingleton<HomeCubit>(
    HomeCubit(
      _homeDataSl(),
      _toggleFavoriteSl(),
      _categoriesSl(),
      _fetchFavoritesSl(),
    ),
  );
  // Cart.
  cartSl.registerSingleton<CartService>(CartService());
  cartSl.registerSingleton<CartRepository>(CartRepositoryImpl(cartSl()));
  _getCartsSl.registerSingleton<GetCartsUsecase>(GetCartsUsecase(cartSl()));
  _updateCartSl.registerSingleton<UpdateCartUsecase>(
    UpdateCartUsecase(cartSl()),
  );
  _addRemoveCartSl.registerSingleton<AddRemoveCartsUsecase>(
    AddRemoveCartsUsecase(cartSl()),
  );
  cartSl.registerSingleton<CartCubit>(
    CartCubit(_getCartsSl(), _updateCartSl(), _addRemoveCartSl()),
  );
  // homeSl.registerSingletonAsync(() async {
  //   final homeCubit = HomeCubit(homeSl());
  //   await homeCubit.ftechHomeData();
  //   return homeCubit;
  // });
}
