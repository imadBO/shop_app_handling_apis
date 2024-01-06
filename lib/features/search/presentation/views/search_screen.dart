import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_app_handeling_apis/core/resources/colors_manager.dart';
import 'package:shop_app_handeling_apis/core/resources/strings_manager.dart';
import 'package:shop_app_handeling_apis/features/home/presentation/widgets/product_item.dart';
import 'package:shop_app_handeling_apis/features/search/presentation/cubits/search_cubit.dart';
import 'package:shop_app_handeling_apis/features/search/presentation/cubits/search_states.dart'
    as search_states;
import 'package:shop_app_handeling_apis/gubits/shop_cubit.dart';
import 'package:shop_app_handeling_apis/gubits/shop_states.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        ShopCubit shopCubit = ShopCubit.get(context);
        return BlocConsumer<SearchCubit, search_states.SearchStates>(
          listener: (context, state) {
            if (state is search_states.SearchMatchesErrorState) {
              Fluttertoast.showToast(
                msg: state.error,
                backgroundColor: ColorsManager.error,
                textColor: ColorsManager.white,
              );
            }
          },
          builder: (BuildContext context, state) {
            SearchCubit searchCubit = SearchCubit.get(context);
            return Scaffold(
              appBar: AppBar(
                title: SearchBar(
                  hintText: StringsManager.searchBarHint,
                  elevation: const MaterialStatePropertyAll(0),
                  shape: const MaterialStatePropertyAll(
                      ContinuousRectangleBorder()),
                  padding: const MaterialStatePropertyAll(EdgeInsets.zero),
                  constraints: const BoxConstraints(maxHeight: 45),
                  onChanged: (value) {
                    searchCubit.search(input: value);
                  },
                ),
              ),
              body: searchCubit.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : searchCubit.searchResult.isEmpty
                      ? const Center(
                          child: Text(StringsManager.searchPlaceholder),
                        )
                      : GridView.builder(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, // Number of columns in the grid
                            crossAxisSpacing: 2,
                            mainAxisSpacing: 2,
                            childAspectRatio: 1 / 1.5,
                          ),
                          itemBuilder: (context, index) {
                            return ProductItem(
                              product: searchCubit.searchResult[index],
                              // favoriteCallback: shopCubit.toggleFavorite,
                              tapCallback: shopCubit.fetchProductDetails,
                            );
                          },
                          itemCount: searchCubit.searchResult.length,
                        ),
            );
          },
        );
      },
    );
  }
}
