import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_handeling_apis/core/resources/colors_manager.dart';
import 'package:shop_app_handeling_apis/core/resources/routes_manager.dart';
import 'package:shop_app_handeling_apis/core/resources/strings_manager.dart';
import 'package:shop_app_handeling_apis/features/account/presentation/cubits/account_cubit.dart';
import 'package:shop_app_handeling_apis/features/account/presentation/cubits/account_states.dart';
import 'package:shop_app_handeling_apis/features/cart/presentation/views/cart_screen.dart';
import 'package:shop_app_handeling_apis/features/home/presentation/cubits/home_cubit.dart';
import 'package:shop_app_handeling_apis/features/home/presentation/cubits/home_states.dart';
import 'package:shop_app_handeling_apis/features/home/presentation/views/categories_screen.dart';
import 'package:shop_app_handeling_apis/features/home/presentation/views/favorites_screen.dart';
import 'package:shop_app_handeling_apis/features/home/presentation/views/home_screen.dart';
import 'package:shop_app_handeling_apis/features/search/presentation/views/search_screen.dart';
import 'package:shop_app_handeling_apis/features/search/presentation/widgets/search_bar.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ShopScreenLayout extends StatelessWidget {
  ShopScreenLayout({super.key});

  final List<Widget> shopPages = const [
    HomeScreen(),
    CategoriesScreen(),
    FavoritesScreen(),
    CartScreen(),
  ];

  final List<String> titles = const [
    StringsManager.homeTitle,
    StringsManager.categoriesTitle,
    StringsManager.favoritesTitle,
    StringsManager.cartTitle,
  ];
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (BuildContext context, Object? state) {
        final homeCubit = HomeCubit.get(context);
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
                      color: ColorsManager.primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                    title: Text(
                      titles[homeCubit.index],
                    ),
                    leading: BlocConsumer<AccountCubit, AccountStates>(
                      listener: (context, state) {},
                      builder: (BuildContext context, state) {
                        final accountCubit = AccountCubit.get(context);
                        return IconButton(
                          onPressed: () {
                            accountCubit.getProfile();
                            Navigator.of(context).pushNamed(
                              Routes.profileRoute,
                            );
                          },
                          icon: const Icon(
                            Icons.person_2_outlined,
                          ),
                        );
                      },
                    ),
                    actions: [
                      Visibility(
                        visible: homeCubit.showActions,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const SearchScreen(),
                                ),
                              );
                            },
                            child: const Icon(Icons.search),
                          ),
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
                              homeCubit.updateActionsVisibility(
                                  (info.visibleFraction == 0));
                            },
                            child: CustomSearchBar(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const SearchScreen(),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ];
              },
              body: shopPages[homeCubit.index],
            ),
          ),
          bottomNavigationBar: NavigationBar(
            onDestinationSelected: (value) {
              homeCubit.updateIndex(value, context);
            },
            selectedIndex: homeCubit.index,
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.home_outlined),
                selectedIcon: Icon(
                  Icons.home,
                  color: ColorsManager.primary,
                ),
                label: StringsManager.homeTitle,
              ),
              NavigationDestination(
                icon: Icon(Icons.category_outlined),
                selectedIcon: Icon(
                  Icons.category,
                  color: ColorsManager.primary,
                ),
                label: StringsManager.categoriesTitle,
              ),
              NavigationDestination(
                icon: Icon(Icons.favorite_border),
                selectedIcon: Icon(
                  Icons.favorite,
                  color: ColorsManager.primary,
                ),
                label: StringsManager.favoritesTitle,
              ),
              NavigationDestination(
                icon: Icon(Icons.shopping_cart_outlined),
                selectedIcon: Icon(
                  Icons.shopping_cart,
                  color: ColorsManager.primary,
                ),
                label: StringsManager.cartTitle,
              ),
            ],
          ),
        );
      },
    );
  }
}
