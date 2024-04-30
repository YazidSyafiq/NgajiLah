import 'package:flutter/material.dart';
import 'package:ngajilah/constant/assets_constant.dart';
import 'package:ngajilah/constant/text_style_constant.dart';

class Screen3 extends StatelessWidget {
  const Screen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          Assets.familyReadQuranImage,
          width: 350,
          height: 350,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Aplikasi Al-Quran untuk Semua Usia',
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
            'Baik untuk pemula maupun yang berpengalaman, aplikasi ini menawarkan sesuatu untuk semua orang. Mari bergabung dengan komunitas kami!',
            style: TextStyleCollection.poppinsNormal,
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}
