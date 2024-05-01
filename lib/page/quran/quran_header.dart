import 'package:flutter/material.dart';
import 'package:ngajilah/constant/assets_constant.dart';
import 'package:ngajilah/constant/text_style_constant.dart';

class QuranHeader extends StatelessWidget {
  const QuranHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 5),
            child: Image.asset(
              Assets.quranLetter,
              height: 50,
            ),
          ),
          Text(
            'Mari jelajahi setiap ayat-ayat suci ini',
            style: TextStyleCollection.poppinsNormal,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
