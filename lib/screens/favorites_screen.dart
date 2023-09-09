import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_app_handeling_apis/cubits/shop_cubit.dart';
import 'package:shop_app_handeling_apis/cubits/shop_states.dart';
import 'package:shop_app_handeling_apis/widgets/home/product_item.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (BuildContext context, state) {
        if (state is FetchFavoritesSuccessState) {
          if (!state.status) {
            Fluttertoast.showToast(
              msg: state.message!,
              backgroundColor: Colors.red,
              textColor: Colors.white,
            );
          }
        }
        if (state is FetchFavoritesErrorState) {
          Fluttertoast.showToast(
            msg: state.error,
            backgroundColor: Colors.red,
            textColor: Colors.white,
          );
        }
        if (state is DeleteFavoriteSuccessState) {
          if (!state.status) {
            Fluttertoast.showToast(
              msg: state.message!,
              backgroundColor: Colors.red,
              textColor: Colors.white,
            );
          }
        }
        if (state is DeleteFavoriteErrorState) {
          Fluttertoast.showToast(
            msg: state.error,
            backgroundColor: Colors.red,
            textColor: Colors.white,
          );
        }
      },
      builder: (BuildContext context, Object? state) {
        ShopCubit shopCubit = ShopCubit.get(context);
        return shopCubit.isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : shopCubit.fetchedFavResponse == null
                ? const Center(
                    child: Text('No items found !'),
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
                        product: shopCubit.fetchedFavResponse!.data[index].data,
                        favoriteItem: shopCubit.fetchedFavResponse!.data[index],
                        deleteCallback: shopCubit.removeFromFavorites,
                        tapCallback: shopCubit.fetchProductDetails,
                      );
                    },
                    itemCount: shopCubit.fetchedFavResponse!.data.length,
                  );
      },
    );
  }
}
