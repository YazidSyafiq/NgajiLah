import 'package:flutter/material.dart';
import 'package:ngajilah/constant/assets_constant.dart';
import 'package:ngajilah/constant/color_constant.dart';
import 'package:ngajilah/constant/text_style_constant.dart';

class DoaHeader extends StatelessWidget {
  const DoaHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
          image: DecorationImage(
            image: AssetImage(
              Assets.backgroundSplash,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Image.asset(
              Assets.kumpulanDoaLetter,
              height: 50,
            ),
            const SizedBox(
              height: 12,
            ),
            Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 150,
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 16,
                        ),
                        child: Text(
                          'Perbanyak Doa',
                          style: TextStyleCollection.poppinsBold.copyWith(
                            fontSize: 18,
                            color: ColorCollection.royalOrange,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 16,
                        ),
                        child: Text(
                          'Awali setiap langkah baikmu \ndengan berdoa',
                          style: TextStyleCollection.poppinsNormal.copyWith(
                            fontSize: 14,
                            color: ColorCollection.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: -20,
                  right: -15,
                  child: Image.asset(
                    Assets.doaImage2,
                    width: 215,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 24,
            ),
          ],
        ),
      ),
    );
  }
}
