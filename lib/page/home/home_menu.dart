import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ngajilah/constant/assets_constant.dart';
import 'package:ngajilah/constant/color_constant.dart';
import 'package:ngajilah/constant/text_style_constant.dart';

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
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: ColorCollection.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: ColorCollection.semiDarkGrey,
                        offset: const Offset(0, 3),
                        blurRadius: 3,
                        blurStyle: BlurStyle.normal,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          IconMenu.quranIconMenu,
                          height: 40,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Al-Quran',
                          style: TextStyleCollection.poppinsBold.copyWith(
                            fontSize: 12,
                            color: ColorCollection.darkGreen1,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: ColorCollection.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: ColorCollection.semiDarkGrey,
                        offset: const Offset(0, 3),
                        blurRadius: 3,
                        blurStyle: BlurStyle.normal,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          IconMenu.doaIconMenu,
                          height: 40,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Doa',
                          style: TextStyleCollection.poppinsBold.copyWith(
                            fontSize: 12,
                            color: ColorCollection.darkGreen1,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: ColorCollection.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: ColorCollection.semiDarkGrey,
                        offset: const Offset(0, 3),
                        blurRadius: 3,
                        blurStyle: BlurStyle.normal,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          IconMenu.tasbihIconMenu,
                          height: 40,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Tasbih',
                          style: TextStyleCollection.poppinsBold.copyWith(
                            fontSize: 12,
                            color: ColorCollection.darkGreen1,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: ColorCollection.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: ColorCollection.semiDarkGrey,
                        offset: const Offset(0, 3),
                        blurRadius: 3,
                        blurStyle: BlurStyle.normal,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          IconMenu.asbabunIconMenu,
                          height: 40,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Asbabun',
                          style: TextStyleCollection.poppinsBold.copyWith(
                            fontSize: 12,
                            color: ColorCollection.darkGreen1,
                          ),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
