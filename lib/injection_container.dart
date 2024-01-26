import 'package:get_it/get_it.dart';
import 'package:shop_app_handeling_apis/features/account/data/data_sources/remote/account_service.dart';
import 'package:shop_app_handeling_apis/features/account/data/repository/account_repository_impl.dart';
import 'package:shop_app_handeling_apis/features/account/domain/repository/account_repository.dart';
import 'package:shop_app_handeling_apis/features/account/domain/use_cases/get_profile_usecase.dart';
import 'package:shop_app_handeling_apis/features/account/presentation/cubits/account_cubit.dart';
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
import 'package:shop_app_handeling_apis/features/cart/domain/use_cases/delete_cart_usecase.dart';
import 'package:shop_app_handeling_apis/features/cart/domain/use_cases/get_carts_usecase.dart';
import 'package:shop_app_handeling_apis/features/cart/domain/use_cases/update_cart_usecase.dart';
import 'package:shop_app_handeling_apis/features/cart/presentation/cubits/cart_cubit.dart';
import 'package:shop_app_handeling_apis/features/home/data/data_sources/remote/home_service.dart';
import 'package:shop_app_handeling_apis/features/home/data/repository/home_repository_impl.dart';
import 'package:shop_app_handeling_apis/features/home/domain/repository/home_repository.dart';
import 'package:shop_app_handeling_apis/features/home/domain/use_cases/categories_usecase.dart';
import 'package:shop_app_handeling_apis/features/home/domain/use_cases/category_products_usecase.dart';
import 'package:shop_app_handeling_apis/features/home/domain/use_cases/fetch_favorites_usecase.dart';
import 'package:shop_app_handeling_apis/features/home/domain/use_cases/home_data_usecase.dart';
import 'package:shop_app_handeling_apis/features/home/domain/use_cases/product_details_usecase.dart';
import 'package:shop_app_handeling_apis/features/home/domain/use_cases/toggle_favorite_usecase.dart';
import 'package:shop_app_handeling_apis/features/home/presentation/cubits/home_cubit.dart';
import 'package:shop_app_handeling_apis/features/search/data/data_sources/remote/search_service.dart';
import 'package:shop_app_handeling_apis/features/search/data/repository/search_repository_impl.dart';
import 'package:shop_app_handeling_apis/features/search/domain/repository/search_repository.dart';
import 'package:shop_app_handeling_apis/features/search/domain/use_cases/search_usecase.dart';
import 'package:shop_app_handeling_apis/features/search/presentation/cubits/search_cubit.dart';

final authSl = GetIt.instance;
final searchSl = GetIt.instance;
final homeSl = GetIt.instance;
final cartSl = GetIt.instance;
final accountSl = GetIt.instance;
Future<void> initDependencies() async {
  authSl.registerSingleton<AuthService>(AuthService());
  authSl.registerSingleton<AuthRepository>(AuthRepositoryImpl(authSl()));
  authSl.registerSingleton<LoginUsecase>(LoginUsecase(authSl()));
  authSl.registerSingleton<SignupUsecase>(SignupUsecase(authSl()));
  authSl.registerSingleton<LogoutUsecase>(LogoutUsecase(authSl()));
  authSl.registerSingleton<AuthCubit>(
    AuthCubit(
      authSl<LoginUsecase>(),
      authSl<SignupUsecase>(),
      authSl<LogoutUsecase>(),
    ),
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
  homeSl.registerSingleton<HomeDataUsecase>(
    HomeDataUsecase(homeSl<HomeRepository>()),
  );
  homeSl.registerSingleton<ToggleFavoriteUsecase>(
    ToggleFavoriteUsecase(homeSl()),
  );
  homeSl.registerSingleton<CategoriesUsecase>(
    CategoriesUsecase(
      homeSl<HomeRepository>(),
    ),
  );
  homeSl.registerSingleton<FetchFavoritesUsecase>(
    FetchFavoritesUsecase(homeSl<HomeRepository>()),
  );
  homeSl.registerSingleton<ProductDetailsUsecase>(
    ProductDetailsUsecase(homeSl<HomeRepository>()),
  );
  homeSl.registerSingleton<FetchCategoryProductsUsecase>(
    FetchCategoryProductsUsecase(homeSl<HomeRepository>()),
  );
  homeSl.registerSingleton<HomeCubit>(
    HomeCubit(
      homeSl<HomeDataUsecase>(),
      homeSl<ToggleFavoriteUsecase>(),
      homeSl<CategoriesUsecase>(),
      homeSl<FetchFavoritesUsecase>(),
      homeSl<ProductDetailsUsecase>(),
      homeSl<FetchCategoryProductsUsecase>(),
    ),
  );

  // Cart.
  cartSl.registerSingleton<CartService>(CartService());
  cartSl.registerSingleton<CartRepository>(CartRepositoryImpl(cartSl()));
  cartSl.registerSingleton<GetCartsUsecase>(
    GetCartsUsecase(cartSl<CartRepository>()),
  );
  cartSl.registerSingleton<UpdateCartUsecase>(
    UpdateCartUsecase(cartSl<CartRepository>()),
  );
  cartSl.registerSingleton<AddToCartsUsecase>(
    AddToCartsUsecase(cartSl<CartRepository>()),
  );
  cartSl.registerSingleton<DeleteFromCartsUsecase>(
    DeleteFromCartsUsecase(cartSl<CartRepository>()),
  );
  cartSl.registerSingleton<CartCubit>(
    CartCubit(
      cartSl<GetCartsUsecase>(),
      cartSl<UpdateCartUsecase>(),
      cartSl<AddToCartsUsecase>(),
      cartSl<DeleteFromCartsUsecase>(),
    ),
  );

  // Account.
  accountSl.registerSingleton<AccountService>(AccountService());
  accountSl.registerSingleton<AccountRepository>(
    AccountRepositoryImpl(accountSl<AccountService>()),
  );
  accountSl.registerSingleton<GetProfileUsecase>(
    GetProfileUsecase(accountSl<AccountRepository>()),
  );
  accountSl.registerSingleton<AccountCubit>(
    AccountCubit(accountSl<GetProfileUsecase>()),
  );
}
