import 'package:flutter/material.dart';
import 'package:ngajilah/constant/assets_constant.dart';
import 'package:ngajilah/constant/color_constant.dart';
import 'package:ngajilah/constant/text_style_constant.dart';

class TasbihContainer extends StatelessWidget {
  const TasbihContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 125,
          width: double.infinity,
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: const [0.4, 0.6],
              colors: [
                ColorCollection.vividOrange,
                ColorCollection.princetonOrange,
              ],
            ),
            image: DecorationImage(
              image: AssetImage(
                Assets.pattern2,
              ),
              fit: BoxFit.cover,
              opacity: 0.2,
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
                  'Dzikir Lancar Selalu',
                  style: TextStyleCollection.poppinsBold.copyWith(
                    fontSize: 18,
                    color: ColorCollection.darkGreen1,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                ),
                child: Text(
                  'Tidak perlu khawatir, \ndzikir counter tersedia di sini',
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
          top: -30,
          right: -25,
          child: Image.asset(
            Assets.tasbihImageContainer,
            width: 180,
          ),
        )
      ],
    );
  }
}
