import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_handeling_apis/features/auth/presentation/views/login_screen.dart';
import 'package:shop_app_handeling_apis/gubits/general_app_cubit.dart';
import 'package:shop_app_handeling_apis/gubits/general_app_states.dart';
import 'package:shop_app_handeling_apis/shared/cached_helper.dart';
import 'package:shop_app_handeling_apis/shared/constants.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController pageController = PageController();
  int page = 0;

  void getStarted(context) {
    CachedHelper.putData('showOnboarding', false);
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => LoginScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GeneralAppCubit, GeneralAppStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        GeneralAppCubit cubit = GeneralAppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            actions: [
              Visibility(
                visible: page != 2,
                child: TextButton(
                  onPressed: () {
                    getStarted(context);
                  },
                  child: const Row(
                    children: [
                      Text('SKIP'),
                      Icon(Icons.arrow_forward_ios, size: 14),
                    ],
                  ),
                ),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: pageController,
                    onPageChanged: (value) {
                      setState(() {
                        page = value;
                      });
                    },
                    itemBuilder: (context, index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Spacer(),
                          Image(
                            image: AssetImage(cubit.onBoardingImages[index]),
                          ),
                          const Spacer(),
                          Text(
                            cubit.onBoardingTitles[index],
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          Text(
                            cubit.onBoardingPassages[index],
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey,
                            ),
                          ),
                          const Spacer(),
                        ],
                      );
                    },
                    itemCount: 3,
                  ),
                ),
                page != 2
                    ? SmoothPageIndicator(
                        controller: pageController,
                        count: 3,
                      )
                    : MaterialButton(
                        color: kPrimaryColor,
                        textColor: Colors.white,
                        minWidth: double.infinity,
                        height: 50,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        onPressed: () {
                          getStarted(context);
                        },
                        child: const Text(
                          'Get started',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
              ],
            ),
          ),
        );
      },
    );
  }
}
