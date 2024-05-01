import 'package:flutter/material.dart';
import 'package:ngajilah/constant/assets_constant.dart';
import 'package:ngajilah/constant/color_constant.dart';
import 'package:ngajilah/constant/text_style_constant.dart';
import 'package:ngajilah/page/home/home_page.dart';
import 'package:ngajilah/utils/shared_pref_utils.dart';

class Screen4 extends StatelessWidget {
  const Screen4({super.key});

  @override
  Widget build(BuildContext context) {
    String token = 'irsyadyazidsyafiq@gmail.com';

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          Assets.maleFemaleQuranImage,
          width: 350,
          height: 350,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Bersama Menuju Kedamaian',
            style: TextStyleCollection.poppinsBold.copyWith(fontSize: 20),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 40),
          width: double.infinity,
          height: 47.5,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: ColorCollection.darkGreen1,
            boxShadow: [
              BoxShadow(
                color: ColorCollection.semiDarkGrey,
                offset: const Offset(0, 5),
                blurRadius: 5,
                blurStyle: BlurStyle.normal,
              ),
            ],
            image: DecorationImage(
              image: AssetImage(
                Assets.pattern1,
              ),
              fit: BoxFit.cover,
              opacity: 0.20,
            ),
          ),
          child: ElevatedButton(
            onPressed: () {
              SharedPref.saveToken(token: token);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              foregroundColor: ColorCollection.white,
            ),
            child: Text(
              'Mulai Mengaji',
              style: TextStyleCollection.poppinsBold.copyWith(
                color: ColorCollection.white,
                fontSize: 20,
              ),
            ),
          ),
        )
      ],
    );
  }
}
