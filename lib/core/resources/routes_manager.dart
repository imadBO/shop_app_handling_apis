import 'package:flutter/material.dart';
import 'package:shop_app_handeling_apis/core/resources/strings_manager.dart';
import 'package:shop_app_handeling_apis/features/auth/presentation/views/login_screen.dart';
import 'package:shop_app_handeling_apis/features/auth/presentation/views/onboarding_screen.dart';
import 'package:shop_app_handeling_apis/features/auth/presentation/views/register_screen.dart';
import 'package:shop_app_handeling_apis/features/auth/presentation/views/shop_screen_layout.dart';
import 'package:shop_app_handeling_apis/features/home/domain/entities/product_entity.dart';
import 'package:shop_app_handeling_apis/features/home/presentation/views/category_products_screen.dart';
import 'package:shop_app_handeling_apis/features/home/presentation/views/home_screen.dart';
import 'package:shop_app_handeling_apis/features/home/presentation/views/product_details_screen.dart';

class Routes {
  static const String shopScreenLayoutRoute = '/';
  static const String onBoardingRoute = '/onboarding';
  static const String loginRoute = '/login';
  static const String registerRoute = '/register';
  static const String homeRoute = '/home';
  static const String detailsRoute = '/detailsRoute';
  static const String categoryProductsRoute = '/categoryProducts';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.shopScreenLayoutRoute:
        return MaterialPageRoute(
          builder: (context) => ShopScreenLayout(),
        );
      case Routes.onBoardingRoute:
        return MaterialPageRoute(
          builder: (context) => const OnboardingScreen(),
        );
      case Routes.loginRoute:
        return MaterialPageRoute(
          builder: (context) => LoginScreen(),
        );
      case Routes.registerRoute:
        return MaterialPageRoute(
          builder: (context) => RegisterScreen(),
        );
      case Routes.homeRoute:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      case Routes.detailsRoute:
        return MaterialPageRoute(
          builder: (context) => ProductDetailsScreen(
            product: settings.arguments as ProductEntity,
          ),
        );
      case Routes.categoryProductsRoute:
        return MaterialPageRoute(
          builder: (context) => CategoryProductsScreen(
            categoryName: settings.arguments as String,
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: SafeArea(
              child: Center(
                child: Text(StringsManager.undefinedRoute),
              ),
            ),
          ),
        );
    }
  }
}
