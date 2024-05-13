import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ngajilah/constant/assets_constant.dart';
import 'package:ngajilah/constant/color_constant.dart';
import 'package:ngajilah/page/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:ngajilah/page/onboarding/onboarding_page.dart';
import 'package:ngajilah/utils/shared_pref_utils.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  void checkToken() async {
    final token = await SharedPref.getToken();

    Future.delayed(
      const Duration(
        milliseconds: 300,
      ),
      () {
        if (token != null) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const BottomNavBar(
                initialIndex: 0,
              ),
            ),
            (route) => false,
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const OnboardingPage(),
            ),
          );
        }
      },
    );
  }

  @override
  void initState() {
    checkToken();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: ColorCollection.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.backgroundSplash),
            fit: BoxFit.cover,
            opacity: 0.5,
          ),
        ),
        child: Center(
          child: Image.asset(
            Assets.splashLogo,
            width: 300,
            height: 300,
          ),
        ),
      ),
    );
  }
}
