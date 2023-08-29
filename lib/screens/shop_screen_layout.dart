import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_handeling_apis/cubits/shop_cubit.dart';
import 'package:shop_app_handeling_apis/cubits/shop_states.dart';
import 'package:shop_app_handeling_apis/screens/categories_screen.dart';
import 'package:shop_app_handeling_apis/screens/favorites_screen.dart';
import 'package:shop_app_handeling_apis/screens/home_screen.dart';
import 'package:shop_app_handeling_apis/screens/settings_screen.dart';
import 'package:shop_app_handeling_apis/shared/constants.dart';

class ShopScreenLayout extends StatelessWidget {
  const ShopScreenLayout({super.key});

  final List<Widget> shopPages = const [
    HomeScreen(),
    CategoriesScreen(),
    FavoritesScreen(),
    SettingsScreen(),
  ];

  final List<String> titles = const [
    'Home',
    'Categories',
    'Favorites',
    'Settings',
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ShopCubit>(
      create: (BuildContext context) => ShopCubit(),
      child: BlocConsumer<ShopCubit, ShopStates>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, Object? state) {
          ShopCubit shopCubit = ShopCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(titles[shopCubit.index]),
            ),
            body: shopPages[shopCubit.index],
            bottomNavigationBar: NavigationBar(
              onDestinationSelected: (value) {
                shopCubit.updateIndex(value);
              },
              selectedIndex: shopCubit.index,
              destinations: const [
                NavigationDestination(
                  icon: Icon(Icons.home_outlined),
                  selectedIcon: Icon(Icons.home, color: kPrimaryColor),
                  label: 'Home',
                ),
                NavigationDestination(
                  icon: Icon(Icons.category_outlined),
                  selectedIcon: Icon(Icons.category, color: kPrimaryColor),
                  label: 'Categories',
                ),
                NavigationDestination(
                  icon: Icon(Icons.favorite_border),
                  selectedIcon: Icon(Icons.favorite, color: kPrimaryColor),
                  label: 'Favorites',
                ),
                NavigationDestination(
                  icon: Icon(Icons.settings_outlined),
                  selectedIcon: Icon(Icons.settings, color: kPrimaryColor),
                  label: 'Settings',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
