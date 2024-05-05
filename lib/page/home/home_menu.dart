import 'package:flutter/material.dart';
import 'package:ngajilah/constant/assets_constant.dart';
import 'package:ngajilah/constant/color_constant.dart';
import 'package:ngajilah/page/asbabun/asbabun_page.dart';
import 'package:ngajilah/page/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:ngajilah/page/home/home_menu_container.dart';

class HomeMenu extends StatefulWidget {
  const HomeMenu({super.key});

  @override
  State<HomeMenu> createState() => _HomeMenuState();
}

class _HomeMenuState extends State<HomeMenu> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 16,
        right: 16,
        left: 16,
      ),
      child: Container(
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: const [0, 0.6, 0.8, 0.9],
            colors: [
              ColorCollection.vividOrange,
              ColorCollection.princetonOrange,
              ColorCollection.royalOrange,
              ColorCollection.rajah,
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: ColorCollection.darkGreen1,
              offset: const Offset(0, 2.5),
              blurRadius: 3,
              blurStyle: BlurStyle.normal,
            ),
          ],
          image: DecorationImage(
            image: AssetImage(
              Assets.pattern1,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              HomeMenuContainer(
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const BottomNavBar(
                        initialIndex: 1,
                      ),
                    ),
                    (route) => false,
                  );
                },
                iconAsset: IconMenu.quranIconMenu,
                label: 'Al-Quran',
              ),
              HomeMenuContainer(
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const BottomNavBar(
                        initialIndex: 2,
                      ),
                    ),
                    (route) => false,
                  );
                },
                iconAsset: IconMenu.doaIconMenu,
                label: 'Doa',
              ),
              HomeMenuContainer(
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const BottomNavBar(
                        initialIndex: 3,
                      ),
                    ),
                    (route) => false,
                  );
                },
                iconAsset: IconMenu.tasbihIconMenu,
                label: 'Tasbih',
              ),
              HomeMenuContainer(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AsbabunPage(),
                    ),
                  );
                },
                iconAsset: IconMenu.asbabunIconMenu,
                label: 'Asbabun',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
