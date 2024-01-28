import 'package:flutter/material.dart';
import 'package:shop_app_handeling_apis/core/helpers/cached_helper.dart';
import 'package:shop_app_handeling_apis/core/resources/assets_manager.dart';
import 'package:shop_app_handeling_apis/core/resources/colors_manager.dart';
import 'package:shop_app_handeling_apis/core/resources/strings_manager.dart';
import 'package:shop_app_handeling_apis/features/auth/presentation/views/login_screen.dart';
import 'package:shop_app_handeling_apis/features/auth/presentation/widgets/filled_circle.dart';
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
                  Text(
                    StringsManager.skipButtonLabel,
                    style: TextStyle(fontWeight: FontWeight.w900),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 14,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          const Positioned(
            bottom: -40,
            left: -40,
            child: FilledCircle(
              radius: 250,
              color: ColorsManager.blue,
            ),
          ),
          const Positioned(
            bottom: -50,
            right: -45,
            child: FilledCircle(
              radius: 330,
              color: ColorsManager.blue,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SmoothPageIndicator(
                  controller: pageController,
                  count: 3,
                  effect: const WormEffect(
                    dotColor: ColorsManager.lightGrey,
                    activeDotColor: ColorsManager.primary,
                    type: WormType.thin,
                    radius: 8,
                    dotHeight: 10,
                    dotWidth: 10,
                    spacing: 4,
                  ),
                ),
                const SizedBox(height: 20),
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
                          // const Spacer(),
                          Text(
                            onBoardingTitles[index],
                            style: const TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 25,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            onBoardingPassages[index],
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w900,
                              color: ColorsManager.grey,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Visibility(
                              visible: page == 2,
                              child: MaterialButton(
                                color: ColorsManager.primary,
                                textColor: ColorsManager.white,
                                height: 50,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                onPressed: () {
                                  getStarted(context);
                                },
                                child: const Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      StringsManager.getStartedButtonLabel,
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    SizedBox(width: 10),
                                    Icon(Icons.arrow_forward),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const Spacer(),
                          Image(
                            image: AssetImage(onBoardingImages[index]),
                            fit: BoxFit.contain,
                            height: MediaQuery.of(context).size.height * 0.3,
                          ),
                          const Spacer(),
                        ],
                      );
                    },
                    itemCount: 3,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
