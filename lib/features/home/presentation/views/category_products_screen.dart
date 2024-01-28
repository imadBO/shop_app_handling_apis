import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_handeling_apis/core/resources/strings_manager.dart';
import 'package:shop_app_handeling_apis/features/home/presentation/cubits/home_cubit.dart';
import 'package:shop_app_handeling_apis/features/home/presentation/cubits/home_states.dart';
import 'package:shop_app_handeling_apis/features/home/presentation/widgets/products_grid.dart';

class CategoryProductsScreen extends StatelessWidget {
  const CategoryProductsScreen({super.key, required this.categoryName});
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName),
      ),
      body: BlocConsumer<HomeCubit, HomeStates>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, state) {
          final homeCubit = HomeCubit.get(context);
          return homeCubit.categoryProductsLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : homeCubit.categoryProducts.isEmpty
                  ? const Center(
                      child: Text(StringsManager.categoryEmpty),
                    )
                  : ProductsGrid(
                      productsList: homeCubit.categoryProducts,
                      favoriteCallback: homeCubit.toggleFavorite,
                    );
        },
      ),
    );
  }
}
