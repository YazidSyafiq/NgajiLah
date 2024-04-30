import 'package:flutter/material.dart';
import 'package:ngajilah/constant/assets_constant.dart';
import 'package:ngajilah/constant/text_style_constant.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          Assets.quranImage,
          width: 350,
          height: 350,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Mulai Perjalanan Spiritualitas Anda',
            style: TextStyleCollection.poppinsBold.copyWith(fontSize: 20),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Temukan keindahan dan kedamaian dalam Al-Quran. Kami di sini untuk membantu Anda menjelajahi setiap ayat dan surah dengan mudah',
            style: TextStyleCollection.poppinsNormal,
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}
