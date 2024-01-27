import 'package:flutter/material.dart';
import 'package:shop_app_handeling_apis/core/helpers/cached_helper.dart';
import 'package:shop_app_handeling_apis/core/resources/assets_manager.dart';
import 'package:shop_app_handeling_apis/core/resources/colors_manager.dart';
import 'package:shop_app_handeling_apis/core/resources/strings_manager.dart';
import 'package:shop_app_handeling_apis/features/auth/presentation/views/login_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController pageController = PageController();
  int page = 0;
  List<String> onBoardingTitles = [
    StringsManager.onboardingTitle1,
    StringsManager.onboardingTitle2,
    StringsManager.onboardingTitle3,
  ];
  List<String> onBoardingPassages = [
    StringsManager.onboardingPassage1,
    StringsManager.onboardingPassage2,
    StringsManager.onboardingPassage3,
  ];
  List<String> onBoardingImages = [
    AssetsManager.onboardingImage6,
    AssetsManager.onboardingImage4,
    AssetsManager.onboardingImage5,
  ];
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
    return Scaffold(
      appBar: AppBar(
        actions: [
          Visibility(
            visible: page != 2,
            child: TextButton(
              onPressed: () {
                getStarted(context);
              },
              style: TextButton.styleFrom(
                foregroundColor: ColorsManager.primary,
              ),
              child: const Row(
                children: [
                  Text(StringsManager.skipButtonLabel),
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
                        image: AssetImage(onBoardingImages[index]),
                      ),
                      const Spacer(),
                      Text(
                        onBoardingTitles[index],
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Text(
                        onBoardingPassages[index],
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: ColorsManager.grey,
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
                    effect: const WormEffect(
                      dotColor: ColorsManager.lightGrey,
                      activeDotColor: ColorsManager.primary,
                      radius: 8,
                      dotHeight: 8,
                      dotWidth: 8,
                      spacing: 4,
                    ),
                  )
                : MaterialButton(
                    color: ColorsManager.primary,
                    textColor: ColorsManager.white,
                    minWidth: double.infinity,
                    height: 50,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    onPressed: () {
                      getStarted(context);
                    },
                    child: const Text(
                      StringsManager.getStartedButtonLabel,
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
