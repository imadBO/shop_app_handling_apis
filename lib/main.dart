import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_handeling_apis/core/helpers/cached_helper.dart';
import 'package:shop_app_handeling_apis/core/helpers/dio_helper.dart';
import 'package:shop_app_handeling_apis/core/helpers/observer.dart';
import 'package:shop_app_handeling_apis/core/resources/themes_manager.dart';
import 'package:shop_app_handeling_apis/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:shop_app_handeling_apis/features/auth/presentation/views/login_screen.dart';
import 'package:shop_app_handeling_apis/features/auth/presentation/views/onboarding_screen.dart';
import 'package:shop_app_handeling_apis/features/auth/presentation/views/shop_screen_layout.dart';
import 'package:shop_app_handeling_apis/features/cart/presentation/cubits/cart_cubit.dart';
import 'package:shop_app_handeling_apis/features/home/presentation/cubits/home_cubit.dart';
import 'package:shop_app_handeling_apis/features/search/presentation/cubits/search_cubit.dart';
import 'package:shop_app_handeling_apis/injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CachedHelper.init();
  DioHelper.init();
  Bloc.observer = MyBlocObserver();
  await initDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => authSl<AuthCubit>()),
        BlocProvider(create: (BuildContext context) => searchSl<SearchCubit>()),
        BlocProvider(create: (BuildContext context) => homeSl<HomeCubit>()),
        BlocProvider(create: (BuildContext context) => cartSl<CartCubit>()),
      ],
      child: MaterialApp(
        title: 'Shop app',
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: AuthCubit.isDark ? ThemeMode.dark : ThemeMode.light,
        home: AuthCubit.showOnboarding
            ? const OnboardingScreen()
            : CachedHelper.getData('token') != null
                ? ShopScreenLayout()
                : LoginScreen(),
      ),
    );
  }
}
