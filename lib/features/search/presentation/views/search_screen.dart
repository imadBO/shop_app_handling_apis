import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_app_handeling_apis/core/resources/colors_manager.dart';
import 'package:shop_app_handeling_apis/core/resources/strings_manager.dart';
import 'package:shop_app_handeling_apis/features/home/presentation/cubits/home_cubit.dart';
import 'package:shop_app_handeling_apis/features/home/presentation/cubits/home_states.dart';
import 'package:shop_app_handeling_apis/features/home/presentation/widgets/products_grid.dart';
import 'package:shop_app_handeling_apis/features/search/presentation/cubits/search_cubit.dart';
import 'package:shop_app_handeling_apis/features/search/presentation/cubits/search_states.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, SearchStates>(
      listener: (context, state) {
        if (state is SearchMatchesErrorState) {
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
              shape:
                  const MaterialStatePropertyAll(ContinuousRectangleBorder()),
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
                  : BlocConsumer<HomeCubit, HomeStates>(
                      listener: (context, state) {},
                      builder: (context, Object? state) {
                        final homeCubit = HomeCubit.get(context);
                        return ProductsGrid(
                          productsList: searchCubit.searchResult,
                          favoriteCallback: homeCubit.toggleFavorite,
                        );
                      },
                    ),
        );
      },
    );
  }
}
