import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_app_handeling_apis/cubits/shop_cubit.dart';
import 'package:shop_app_handeling_apis/cubits/shop_states.dart';
import 'package:shop_app_handeling_apis/widgets/home/product_item.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (BuildContext context, state) {
        if (state is SearchMatchesSuccessState) {
          if (!state.status) {
            Fluttertoast.showToast(
              msg: state.message!,
              backgroundColor: Colors.red,
              textColor: Colors.white,
            );
          }
        }
        if (state is SearchMatchesErrorState) {
          Fluttertoast.showToast(
            msg: state.error,
            backgroundColor: Colors.red,
            textColor: Colors.white,
          );
        }
        if (state is ToggleFavoriteSuccessState) {
          if (!state.status) {
            Fluttertoast.showToast(
              msg: state.message!,
              backgroundColor: Colors.red,
              textColor: Colors.white,
            );
          }
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
        ShopCubit shopCubit = ShopCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: SearchBar(
              hintText: 'Search',
              elevation: const MaterialStatePropertyAll(0),
              shape:
                  const MaterialStatePropertyAll(ContinuousRectangleBorder()),
              padding: const MaterialStatePropertyAll(EdgeInsets.zero),
              constraints: const BoxConstraints(maxHeight: 45),
              onChanged: (value) {
                shopCubit.getSearchMatches(input: value);
              },
            ),
          ),
          body: shopCubit.isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : shopCubit.searchResponse == null
                  ? const Center(
                      child: Text('Type something'),
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
                          product: shopCubit.searchResponse!.data[index],
                          favoriteCallback: shopCubit.toggleFavorite,
                          tapCallback: shopCubit.fetchProductDetails,
                        );
                      },
                      itemCount: shopCubit.searchResponse!.data.length,
                    ),
        );
      },
    );
  }
}
