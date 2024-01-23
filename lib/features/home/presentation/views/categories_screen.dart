import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_app_handeling_apis/core/constants.dart';
import 'package:shop_app_handeling_apis/features/home/presentation/cubits/home_cubit.dart';
import 'package:shop_app_handeling_apis/features/home/presentation/cubits/home_states.dart';
import 'package:shop_app_handeling_apis/features/home/presentation/widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (BuildContext context, state) {
        if (state is CategoryProductsErrorState) {
          Fluttertoast.showToast(
            msg: state.error,
            backgroundColor: Colors.red,
            textColor: Colors.white,
          );
        }
      },
      builder: (BuildContext context, Object? state) {
        final homeCubit = HomeCubit.get(context);
        return homeCubit.categoriesLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemBuilder: (context, index) {
                  return CategoryItem(
                    image:
                        '${AppConstants.imagesPath}/${homeCubit.categories[index].id}.jpg',
                    name: homeCubit.categories[index].name,
                    id: homeCubit.categories[index].id,
                  );
                },
                itemCount: homeCubit.categories.length,
              );
      },
    );
  }
}
