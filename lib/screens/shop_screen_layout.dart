import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_handeling_apis/cubits/shop_cubit.dart';
import 'package:shop_app_handeling_apis/cubits/shop_states.dart';
import 'package:shop_app_handeling_apis/screens/categories_screen.dart';
import 'package:shop_app_handeling_apis/screens/favorites_screen.dart';
import 'package:shop_app_handeling_apis/screens/home_screen.dart';
import 'package:shop_app_handeling_apis/screens/settings_screen.dart';
import 'package:shop_app_handeling_apis/shared/constants.dart';
import 'package:shop_app_handeling_apis/widgets/shared/custom_form_field.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ShopScreenLayout extends StatelessWidget {
  ShopScreenLayout({super.key});

  final List<Widget> shopPages = const [
    HomeScreen(),
    CategoriesScreen(),
    FavoritesScreen(),
    SettingsScreen(),
  ];

  final List<String> titles = const [
    'Hanout',
    'Categories',
    'Favorites',
    'Settings',
  ];
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ShopCubit>(
      create: (BuildContext context) => ShopCubit(),
      child: BlocConsumer<ShopCubit, ShopStates>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, Object? state) {
          ShopCubit shopCubit = ShopCubit.get(context);
          return Scaffold(
            body: SafeArea(
              child: NestedScrollView(
                headerSliverBuilder: (context, innerBoxIsScrolled) {
                  return [
                    SliverAppBar(
                      expandedHeight: 100,
                      floating: true,
                      snap: true,
                      pinned: true,
                      titleTextStyle: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                      title: Text(
                        titles[shopCubit.index],
                      ),
                      actions: [
                        Visibility(
                          visible: shopCubit.showActions,
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(Icons.search),
                          ),
                        ),
                      ],
                      flexibleSpace: FlexibleSpaceBar(
                        background: Column(
                          children: [
                            const SizedBox(
                              height: 40,
                            ),
                            VisibilityDetector(
                              key: const Key('FlexibleSpaceBar-key'),
                              onVisibilityChanged: (VisibilityInfo info) {
                                shopCubit.updateActionsVisibility(
                                    (info.visibleFraction == 0));
                              },
                              child: CustomFormField(
                                label: 'Search',
                                controller: searchController,
                                type: TextInputType.text,
                                prefixIcon: Icons.search,
                                height: 40,
                                radius: 20,
                                validator: (val) {
                                  return null;
                                },
                                contentPadding: const EdgeInsets.all(0),
                                marging: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 10),
                                floatingBehavior: FloatingLabelBehavior.never,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ];
                },
                body: shopPages[shopCubit.index],
              ),
            ),
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