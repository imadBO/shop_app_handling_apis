import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_app_handeling_apis/core/resources/colors_manager.dart';
import 'package:shop_app_handeling_apis/core/resources/strings_manager.dart';
import 'package:shop_app_handeling_apis/features/home/presentation/cubits/home_cubit.dart';
import 'package:shop_app_handeling_apis/features/home/presentation/cubits/home_states.dart';
import 'package:shop_app_handeling_apis/features/home/presentation/widgets/banners_slider.dart';
import 'package:shop_app_handeling_apis/features/home/presentation/widgets/products_grid.dart';
import 'package:visibility_detector/visibility_detector.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {
        if (state is HomeDataErrorState) {
          Fluttertoast.showToast(
            msg: state.error,
            backgroundColor: ColorsManager.error,
            textColor: ColorsManager.white,
          );
        }
        if (state is ToggleFavoriteErrorState) {
          Fluttertoast.showToast(
            msg: state.error,
            backgroundColor: ColorsManager.error,
            textColor: ColorsManager.white,
          );
        }
      },
      builder: (BuildContext context, Object? state) {
        final homeCubit = HomeCubit.get(context);

        return homeCubit.homeDataLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    VisibilityDetector(
                      key: const Key('visibility-key'),
                      onVisibilityChanged: (VisibilityInfo info) {
                        homeCubit.updateAutoPlay(!(info.visibleFraction == 0));
                      },
                      child: BannersSlider(homeCubit: homeCubit),
                    ),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                      child: Text(
                        StringsManager.homeProductsLabel,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                    ),
                    ProductsGrid(
                      productsList: homeCubit.homeProducts,
                      favoriteCallback: homeCubit.toggleFavorite,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                    ),
                  ],
                ),
              );
      },
    );
  }
}
