import 'package:flutter/material.dart';
import 'package:ngajilah/constant/assets_constant.dart';
import 'package:ngajilah/constant/text_style_constant.dart';

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          Assets.quranCommunityImage,
          height: 350,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Jadilah Bagian dari Komunitas yang Beriman',
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
            'Temukan fitur-fitur unik yang mendukung perjalanan spiritual Anda, seperti jadwal waktu sholat, kumpulan doa, dan tasbih',
            style: TextStyleCollection.poppinsNormal,
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}
