import 'package:flutter/material.dart';
import 'package:ngajilah/constant/assets_constant.dart';
import 'package:ngajilah/constant/color_constant.dart';
import 'package:ngajilah/constant/text_style_constant.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 5),
            child: Image.asset(
              Assets.assalamualaikumLetter,
              height: 50,
            ),
          ),
        ),
        Text(
          'Selamat Datang di NgajiLah App \nMari bersama-sama perkuat keimanan kita',
          style: TextStyleCollection.poppinsNormal.copyWith(
            color: ColorCollection.mellowApricot,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
