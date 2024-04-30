import 'package:flutter/material.dart';
import 'package:ngajilah/constant/assets_constant.dart';
import 'package:ngajilah/constant/color_constant.dart';
import 'package:ngajilah/constant/text_style_constant.dart';
import 'package:ngajilah/page/onboarding/screen_1.dart';
import 'package:ngajilah/page/onboarding/screen_2.dart';
import 'package:ngajilah/page/onboarding/screen_3.dart';
import 'package:ngajilah/page/onboarding/screen_4.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  PageController pageController = PageController();
  int currentPage = 0;

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              Assets.backgroundSplash,
            ),
            fit: BoxFit.cover,
            opacity: 0.75,
          ),
        ),
        child: Stack(
          children: [
            PageView(
              controller: pageController,
              onPageChanged: (index) {
                currentPage = index;
                setState(() {});
              },
              children: const [
                Screen1(),
                Screen2(),
                Screen3(),
                Screen4(),
              ],
            ),
            Positioned(
              top: 30,
              right: 16,
              child: currentPage != 3
                  ? TextButton(
                      onPressed: () {
                        pageController.jumpToPage(3);
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: ColorCollection.grey,
                      ),
                      child: Text(
                        'Skip',
                        style: TextStyleCollection.poppinsNormal
                            .copyWith(fontSize: 16),
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
            Container(
              alignment: const Alignment(0, 0.925),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  currentPage == 0
                      ? const SizedBox(
                          width: 30,
                        )
                      : IconButton(
                          onPressed: () {
                            pageController.previousPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeIn,
                            );
                          },
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: ColorCollection.darkGreen,
                          ),
                        ),
                  SmoothPageIndicator(
                    controller: pageController,
                    count: 4,
                    effect: ExpandingDotsEffect(
                      dotHeight: 7.5,
                      dotColor: ColorCollection.grey,
                      activeDotColor: ColorCollection.semiDarkGreen,
                    ),
                  ),
                  currentPage == 3
                      ? const SizedBox(
                          width: 30,
                        )
                      : IconButton(
                          onPressed: () {
                            pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeIn,
                            );
                          },
                          icon: Icon(
                            Icons.arrow_forward_ios,
                            color: ColorCollection.darkGreen,
                          ),
                        ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
