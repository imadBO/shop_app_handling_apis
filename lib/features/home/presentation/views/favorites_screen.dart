import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_app_handeling_apis/core/resources/strings_manager.dart';
import 'package:shop_app_handeling_apis/features/home/presentation/cubits/home_cubit.dart';
import 'package:shop_app_handeling_apis/features/home/presentation/cubits/home_states.dart';
import 'package:shop_app_handeling_apis/features/home/presentation/widgets/products_grid.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (BuildContext context, state) {
        if (state is FavoritesErrorState) {
          Fluttertoast.showToast(
            msg: state.error,
            backgroundColor: Colors.red,
            textColor: Colors.white,
          );
        }
        if (state is ToggleFavoriteErrorState) {
          Fluttertoast.showToast(
            msg: state.error,
            backgroundColor: Colors.red,
            textColor: Colors.white,
          );
        }
      },
      builder: (BuildContext context, Object? state) {
        final homeCubit = HomeCubit.get(context);
        return homeCubit.favoritesLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : homeCubit.favorites.isEmpty
                ? const Center(
                    child: Text(StringsManager.noFavorites),
                  )
                : ProductsGrid(
                    productsList: homeCubit.favorites,
                    favoriteCallback: homeCubit.toggleFavorite,
                  );
      },
    );
  }
}
