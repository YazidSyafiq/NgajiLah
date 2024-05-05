import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ngajilah/constant/assets_constant.dart';
import 'package:ngajilah/constant/color_constant.dart';
import 'package:ngajilah/page/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:ngajilah/page/bottom_navigation_bar/bottom_navigation_provider.dart';
import 'package:ngajilah/page/quran/quran_container.dart';
import 'package:ngajilah/page/quran/quran_header.dart';
import 'package:ngajilah/page/quran/quran_tab_bar.dart';
import 'package:provider/provider.dart';

class QuranPage extends StatefulWidget {
  const QuranPage({super.key});

  @override
  State<QuranPage> createState() => _QuranPageState();
}

class _QuranPageState extends State<QuranPage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: ColorCollection.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        int selectedIndex =
            Provider.of<BottomNavbarProvider>(context, listen: false)
                .selectedIndex;
        if (selectedIndex == 1) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const BottomNavBar(
                initialIndex: 0,
              ),
            ),
          );
        }
      },
      child: Scaffold(
        body: DefaultTabController(
          length: 2,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  Assets.backgroundSplash,
                ),
                fit: BoxFit.cover,
                opacity: 0.75,
              ),
            ),
            child: const Column(
              children: [
                QuranHeader(),
                SizedBox(
                  height: 24,
                ),
                ContainerQuran(),
                SizedBox(
                  height: 32,
                ),
                QuranTabBar(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
