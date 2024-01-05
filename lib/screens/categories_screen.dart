import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_handeling_apis/gubits/shop_cubit.dart';
import 'package:shop_app_handeling_apis/gubits/shop_states.dart';
import 'package:shop_app_handeling_apis/widgets/categories/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        ShopCubit shopCubit = ShopCubit.get(context);
        return shopCubit.isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemBuilder: (context, index) {
                  return CategoryItem(
                    image: shopCubit
                        .categoriesResponse!.data!.categories[index].image,
                    name: shopCubit
                        .categoriesResponse!.data!.categories[index].name,
                  );
                },
                itemCount:
                    shopCubit.categoriesResponse!.data!.categories.length,
              );
      },
    );
  }
}
