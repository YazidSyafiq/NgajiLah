import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ngajilah/constant/color_constant.dart';
import 'package:ngajilah/page/home/home_container_1.dart';
import 'package:ngajilah/page/home/home_container_2.dart';
import 'package:ngajilah/page/home/home_container_3.dart';
import 'package:ngajilah/page/home/home_container_4.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PageViewContainer extends StatefulWidget {
  const PageViewContainer({super.key});

  @override
  State<PageViewContainer> createState() => _PageViewContainerState();
}

class _PageViewContainerState extends State<PageViewContainer> {
  PageController pageController = PageController();
  int currentPage = 0;

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: PageView(
              controller: pageController,
              onPageChanged: (index) {
                currentPage = index;
                setState(() {});
              },
              children: const [
                Container1(),
                Container2(),
                Container3(),
                Container4(),
              ],
            ),
          ),
          SmoothPageIndicator(
            controller: pageController,
            count: 4,
            effect: ExpandingDotsEffect(
              dotHeight: 7.5,
              dotColor: ColorCollection.grey,
              activeDotColor: ColorCollection.royalOrange,
            ),
          ),
        ],
      ),
    );
  }
}
