import 'package:flutter/material.dart';
import 'package:shop_app_handeling_apis/core/resources/colors_manager.dart';
import 'package:shop_app_handeling_apis/core/resources/styles_manager.dart';

class ThemesManager {
  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: ColorsManager.white,
    primaryColor: ColorsManager.primary,
    useMaterial3: true,
    appBarTheme: const AppBarTheme(
      color: ColorsManager.white,
      elevation: 0,
      titleTextStyle: StylesManager.titleLarge,
      actionsIconTheme: IconThemeData(color: ColorsManager.primary),
      iconTheme: IconThemeData(color: ColorsManager.primary),
    ),
    textTheme: const TextTheme(
      titleLarge: StylesManager.titleLarge,
      titleMedium: StylesManager.titleMedium,
      titleSmall: StylesManager.titleSmall,
      headlineLarge: StylesManager.headlineLarge,
      headlineMedium: StylesManager.headlineMedium,
      headlineSmall: StylesManager.headlineSmall,
      bodyLarge: StylesManager.bodyLarge,
      bodyMedium: StylesManager.bodyMedium,
      bodySmall: StylesManager.bodySmall,
      labelLarge: StylesManager.labelLarge,
      labelMedium: StylesManager.labelMedium,
      labelSmall: StylesManager.labelSmall,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: ColorsManager.white,
      elevation: 0,
      selectedIconTheme: IconThemeData(color: ColorsManager.primary),
      selectedItemColor: ColorsManager.primary,
      selectedLabelStyle: StylesManager.labelSmall,
      unselectedIconTheme: IconThemeData(color: ColorsManager.grey),
      unselectedItemColor: ColorsManager.grey,
      unselectedLabelStyle: StylesManager.labelSmall,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: ColorsManager.primary,
      foregroundColor: ColorsManager.white,
      splashColor: ColorsManager.platinum,
    ),
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: StylesManager.titleSmall.copyWith(color: ColorsManager.grey),
      floatingLabelStyle: StylesManager.titleSmall,
      iconColor: ColorsManager.grey,
      prefixIconColor: ColorsManager.grey,
      suffixIconColor: ColorsManager.grey,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStatePropertyAll(
          StylesManager.labelMedium.copyWith(color: ColorsManager.white),
        ),
        backgroundColor: const MaterialStatePropertyAll(ColorsManager.primary),
        padding: const MaterialStatePropertyAll(
          EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        ),
        shape: const MaterialStatePropertyAll(StadiumBorder()),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStatePropertyAll(
          StylesManager.labelMedium.copyWith(color: ColorsManager.white),
        ),
        backgroundColor: const MaterialStatePropertyAll(ColorsManager.primary),
        padding: const MaterialStatePropertyAll(
          EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        ),
        shape: const MaterialStatePropertyAll(StadiumBorder()),
        shadowColor: const MaterialStatePropertyAll(ColorsManager.silver),
        elevation: MaterialStateProperty.all(4),
      ),
    ),
    outlinedButtonTheme: const OutlinedButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStatePropertyAll(
          StylesManager.labelMedium,
        ),
        backgroundColor: MaterialStatePropertyAll(ColorsManager.transparent),
        padding: MaterialStatePropertyAll(
          EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        ),
        shape: MaterialStatePropertyAll(
          StadiumBorder(
            side: BorderSide(color: ColorsManager.primary, width: 2),
          ),
        ),
      ),
    ),
    cardTheme: const CardTheme(
      color: ColorsManager.white,
      elevation: 5,
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: ColorsManager.darkThemeBackGround,
    primaryColor: ColorsManager.darkThemeBackGround,
    useMaterial3: true,
    appBarTheme: AppBarTheme(
      color: ColorsManager.darkThemeBackGround,
      elevation: 0,
      titleTextStyle: StylesManager.titleLarge
          .copyWith(color: ColorsManager.darkThemePrimaryText),
      actionsIconTheme:
          const IconThemeData(color: ColorsManager.darkThemeSecondaryText),
      iconTheme:
          const IconThemeData(color: ColorsManager.darkThemeSecondaryText),
    ),
    textTheme: TextTheme(
      titleLarge: StylesManager.titleLarge
          .copyWith(color: ColorsManager.darkThemePrimaryText),
      titleMedium: StylesManager.titleMedium
          .copyWith(color: ColorsManager.darkThemePrimaryText),
      titleSmall: StylesManager.titleSmall
          .copyWith(color: ColorsManager.darkThemeSecondaryText),
      headlineLarge: StylesManager.headlineLarge
          .copyWith(color: ColorsManager.darkThemePrimaryText),
      headlineMedium: StylesManager.headlineMedium
          .copyWith(color: ColorsManager.darkThemePrimaryText),
      headlineSmall: StylesManager.headlineSmall
          .copyWith(color: ColorsManager.darkThemeSecondaryText),
      bodyLarge: StylesManager.bodyLarge
          .copyWith(color: ColorsManager.darkThemePrimaryText),
      bodyMedium: StylesManager.bodyMedium
          .copyWith(color: ColorsManager.darkThemePrimaryText),
      bodySmall: StylesManager.bodySmall
          .copyWith(color: ColorsManager.darkThemeSecondaryText),
      labelLarge: StylesManager.labelLarge
          .copyWith(color: ColorsManager.darkThemePrimaryText),
      labelMedium: StylesManager.labelMedium
          .copyWith(color: ColorsManager.darkThemePrimaryText),
      labelSmall: StylesManager.labelSmall
          .copyWith(color: ColorsManager.darkThemeSecondaryText),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: ColorsManager.darkThemeCard,
      elevation: 0,
      selectedIconTheme: const IconThemeData(
        color: ColorsManager.darkThemePrimaryText,
      ),
      selectedItemColor: ColorsManager.darkThemePrimaryText,
      selectedLabelStyle: StylesManager.labelSmall
          .copyWith(color: ColorsManager.darkThemePrimaryText),
      unselectedIconTheme:
          const IconThemeData(color: ColorsManager.darkThemeHover),
      unselectedItemColor: ColorsManager.darkThemeHover,
      unselectedLabelStyle: StylesManager.labelSmall.copyWith(
        color: ColorsManager.darkThemeHover,
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: ColorsManager.darkThemeCard,
      foregroundColor: ColorsManager.darkThemePrimaryText,
      splashColor: ColorsManager.darkThemeSecondaryText,
    ),
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: StylesManager.titleSmall.copyWith(
        color: ColorsManager.darkThemePrimaryText,
      ),
      floatingLabelStyle: StylesManager.titleSmall.copyWith(
        color: ColorsManager.darkThemePrimaryText,
      ),
      iconColor: ColorsManager.darkThemePrimaryText,
      prefixIconColor: ColorsManager.darkThemePrimaryText,
      suffixIconColor: ColorsManager.darkThemePrimaryText,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: ColorsManager.darkThemePrimaryText),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStatePropertyAll(
          StylesManager.labelMedium
              .copyWith(color: ColorsManager.darkThemeBackGround),
        ),
        backgroundColor:
            const MaterialStatePropertyAll(ColorsManager.darkThemePrimaryText),
        padding: const MaterialStatePropertyAll(
          EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        ),
        shape: const MaterialStatePropertyAll(StadiumBorder()),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStatePropertyAll(
          StylesManager.labelMedium
              .copyWith(color: ColorsManager.darkThemeBackGround),
        ),
        backgroundColor:
            const MaterialStatePropertyAll(ColorsManager.darkThemePrimaryText),
        padding: const MaterialStatePropertyAll(
          EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        ),
        shape: const MaterialStatePropertyAll(StadiumBorder()),
        shadowColor: const MaterialStatePropertyAll(ColorsManager.silver),
        elevation: MaterialStateProperty.all(4),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStatePropertyAll(
          StylesManager.labelMedium.copyWith(
            color: ColorsManager.darkThemePrimaryText,
          ),
        ),
        backgroundColor: const MaterialStatePropertyAll(
          ColorsManager.transparent,
        ),
        padding: const MaterialStatePropertyAll(
          EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        ),
        shape: const MaterialStatePropertyAll(
          StadiumBorder(
            side: BorderSide(
              color: ColorsManager.darkThemePrimaryText,
              width: 2,
            ),
          ),
        ),
      ),
    ),
    cardTheme: const CardTheme(
      color: ColorsManager.darkThemeCard,
      elevation: 5,
    ),
  );
}
