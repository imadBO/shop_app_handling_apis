import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_handeling_apis/core/helpers/cached_helper.dart';
import 'package:shop_app_handeling_apis/core/helpers/dio_helper.dart' ;
import 'package:shop_app_handeling_apis/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:shop_app_handeling_apis/features/auth/presentation/views/login_screen.dart';
import 'package:shop_app_handeling_apis/gubits/general_app_cubit.dart';
import 'package:shop_app_handeling_apis/gubits/general_app_states.dart';
import 'package:shop_app_handeling_apis/gubits/shop_cubit.dart';
import 'package:shop_app_handeling_apis/injection_container.dart';
import 'package:shop_app_handeling_apis/screens/shop_screen_layout.dart';
import 'package:shop_app_handeling_apis/screens/onboarding_screen.dart';

import 'package:shop_app_handeling_apis/shared/observer.dart';
import 'package:shop_app_handeling_apis/shared/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CachedHelper.init();
  DioHelper.init();
  Bloc.observer = MyBlocObserver();
  await initDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => GeneralAppCubit()),
        BlocProvider(create: (BuildContext context) => authSl<AuthCubit>()),
        BlocProvider(create: (BuildContext context) => ShopCubit()),
      ],
      child: BlocConsumer<GeneralAppCubit, GeneralAppStates>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, Object? state) {
          return MaterialApp(
            title: 'Shop app',
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: GeneralAppCubit.get(context).isDark
                ? ThemeMode.dark
                : ThemeMode.light,
            home: GeneralAppCubit.get(context).showOnboarding
                ? const OnboardingScreen()
                : CachedHelper.getData('token') != null
                    ? ShopScreenLayout()
                    : LoginScreen(),
          );
        },
      ),
    );
  }
}
