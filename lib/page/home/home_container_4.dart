import 'package:flutter/material.dart';
import 'package:ngajilah/constant/assets_constant.dart';
import 'package:ngajilah/constant/color_constant.dart';
import 'package:ngajilah/constant/text_style_constant.dart';

class Container4 extends StatelessWidget {
  const Container4({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
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
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: const [0, 0.3, 0.4, 0.6, 0.8, 0.975],
              colors: [
                ColorCollection.vividOrange,
                ColorCollection.princetonOrange,
                ColorCollection.royalOrange,
                ColorCollection.rajah,
                ColorCollection.mellowApricot,
                ColorCollection.transparent,
              ],
            ),
            image: DecorationImage(
              image: AssetImage(
                Assets.pattern1,
              ),
              fit: BoxFit.cover,
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
                  'Dzikir Lancar',
                  style: TextStyleCollection.poppinsBold.copyWith(
                    fontSize: 20,
                    color: ColorCollection.darkGreen1,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                ),
                child: Text(
                  'Dengan dzikir counter, \nDzikir no ribet',
                  style: TextStyleCollection.poppinsNormal.copyWith(
                    fontSize: 16,
                    color: ColorCollection.darkGreen1,
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: -20,
          right: -25,
          child: Image.asset(
            Assets.dzikirImage,
            width: 220,
          ),
        )
      ],
    );
  }
}
