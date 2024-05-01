import 'package:flutter/material.dart';
import 'package:ngajilah/constant/assets_constant.dart';
import 'package:ngajilah/constant/color_constant.dart';
import 'package:ngajilah/constant/text_style_constant.dart';
import 'package:ngajilah/page/quran/quran_show_juz.dart';
import 'package:ngajilah/page/quran/quran_show_surah.dart';

class QuranTabBar extends StatelessWidget {
  const QuranTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Container(
            height: 70,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.bottomRight,
                stops: const [0.2, 0.45, 0.6, 0.7, 0.8, 0.9, 0.95],
                colors: [
                  ColorCollection.darkGreen1,
                  ColorCollection.blueGreen,
                  ColorCollection.castletonGreen,
                  ColorCollection.bangladeshGreen,
                  ColorCollection.bangladeshGreen1,
                  ColorCollection.spanishViridian,
                  ColorCollection.genericViridian,
                ],
              ),
              image: DecorationImage(
                image: AssetImage(Assets.pattern2),
                fit: BoxFit.cover,
                opacity: 0.1,
              ),
            ),
            child: TabBar(
              unselectedLabelColor: ColorCollection.grey,
              indicatorColor: ColorCollection.princetonOrange,
              labelColor: ColorCollection.white,
              indicatorWeight: 7,
              indicatorSize: TabBarIndicatorSize.tab,
              dividerHeight: 7,
              dividerColor: ColorCollection.grey,
              tabs: [
                Text(
                  'Surah',
                  style: TextStyleCollection.poppinsBoldMenu,
                ),
                Text(
                  'Juz',
                  style: TextStyleCollection.poppinsBoldMenu,
                ),
              ],
            ),
          ),
          const Expanded(
            child: TabBarView(
              children: [
                ShowSurah(),
                ShowJuz(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
