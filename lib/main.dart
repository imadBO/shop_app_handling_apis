import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_handeling_apis/cubits/auth_cubit.dart';
import 'package:shop_app_handeling_apis/cubits/general_app_cubit.dart';
import 'package:shop_app_handeling_apis/cubits/general_app_states.dart';
import 'package:shop_app_handeling_apis/screens/home_screen.dart';
import 'package:shop_app_handeling_apis/screens/login_screen.dart';
import 'package:shop_app_handeling_apis/screens/onboarding_screen.dart';
import 'package:shop_app_handeling_apis/shared/cached_helper.dart';
import 'package:shop_app_handeling_apis/shared/dio_helper.dart';
import 'package:shop_app_handeling_apis/shared/observer.dart';
import 'package:shop_app_handeling_apis/shared/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CachedHelper.init();
  DioHelper.init();
  Bloc.observer = MyBlocObserver();
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
        BlocProvider(create: (BuildContext context) => AuthCubit()),
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
                    ? const HomeScreen()
                    : LoginScreen(),
          );
        },
      ),
    );
  }
}
