import 'package:flutter/material.dart';
import 'package:shop_app_handeling_apis/core/constants.dart';
import 'package:shop_app_handeling_apis/core/resources/colors_manager.dart';
import 'package:shop_app_handeling_apis/core/resources/fonts_manager.dart';

class StylesManager {
  static const titleLarge = TextStyle(
    fontFamily: AppConstants.fontFamily,
    fontSize: FontsSizes.s20,
    fontWeight: FontsWeights.bold,
    color: ColorsManager.primary,
  );

  static const titleMedium = TextStyle(
    fontFamily: AppConstants.fontFamily,
    fontSize: FontsSizes.s18,
    fontWeight: FontsWeights.bold,
    color: ColorsManager.primary,
  );

  static const titleSmall = TextStyle(
    fontFamily: AppConstants.fontFamily,
    fontSize: FontsSizes.s16,
    fontWeight: FontsWeights.bold,
    color: ColorsManager.primary,
  );

  static const headlineLarge = TextStyle(
    fontFamily: AppConstants.fontFamily,
    fontSize: FontsSizes.s24,
    fontWeight: FontsWeights.semiBold,
    color: ColorsManager.primary,
  );

  static const headlineMedium = TextStyle(
    fontFamily: AppConstants.fontFamily,
    fontSize: FontsSizes.s20,
    fontWeight: FontsWeights.medium,
    color: ColorsManager.primary,
  );

  static const headlineSmall = TextStyle(
    fontFamily: AppConstants.fontFamily,
    fontSize: FontsSizes.s16,
    fontWeight: FontsWeights.regular,
    color: ColorsManager.primary,
  );

  static const bodyLarge = TextStyle(
    fontFamily: AppConstants.fontFamily,
    fontSize: FontsSizes.s18,
    fontWeight: FontsWeights.regular,
    color: ColorsManager.primary,
  );

  static const bodyMedium = TextStyle(
    fontFamily: AppConstants.fontFamily,
    fontSize: FontsSizes.s16,
    fontWeight: FontsWeights.regular,
    color: ColorsManager.primary,
  );

  static const bodySmall = TextStyle(
    fontFamily: AppConstants.fontFamily,
    fontSize: FontsSizes.s14,
    fontWeight: FontsWeights.regular,
    color: ColorsManager.primary,
  );

  static const labelLarge = TextStyle(
    fontFamily: AppConstants.fontFamily,
    fontSize: FontsSizes.s18,
    fontWeight: FontsWeights.semiBold,
    color: ColorsManager.primary,
  );

  static const labelMedium = TextStyle(
    fontFamily: AppConstants.fontFamily,
    fontSize: FontsSizes.s16,
    fontWeight: FontsWeights.semiBold,
    color: ColorsManager.primary,
  );

  static const labelSmall = TextStyle(
    fontFamily: AppConstants.fontFamily,
    fontSize: FontsSizes.s14,
    fontWeight: FontsWeights.semiBold,
    color: ColorsManager.primary,
  );
}
