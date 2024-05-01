import 'package:flutter/material.dart';
import 'package:ngajilah/constant/color_constant.dart';
import 'package:ngajilah/constant/text_style_constant.dart';

class HomeMenuContainer extends StatelessWidget {
  const HomeMenuContainer({
    super.key,
    required this.onTap,
    required this.iconAsset,
    required this.label,
  });

  final void Function()? onTap;
  final String iconAsset;
  final String label;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
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
                iconAsset,
                height: 40,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                label,
                style: TextStyleCollection.poppinsBold.copyWith(
                  fontSize: 12,
                  color: ColorCollection.darkGreen1,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
