import 'package:flutter/material.dart';
import 'package:ngajilah/constant/assets_constant.dart';
import 'package:ngajilah/constant/color_constant.dart';
import 'package:ngajilah/constant/text_style_constant.dart';

class ErrorGlobalWidget extends StatelessWidget {
  const ErrorGlobalWidget({
    super.key,
    required this.errorText,
    required this.onRefresh,
  });

  final String errorText;
  final void Function() onRefresh;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset(
              Assets.errorImage,
              height: 150,
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              'Yah, ada sedikit masalah',
              style: TextStyleCollection.poppinsBold.copyWith(
                fontSize: 16,
                color: ColorCollection.darkGreen1,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              errorText,
              style: TextStyleCollection.poppinsNormal.copyWith(
                fontSize: 14,
                color: ColorCollection.darkGreen1,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 12,
            ),
            Container(
              width: 125,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: const [0, 0.6, 0.8, 0.9],
                  colors: [
                    ColorCollection.vividOrange,
                    ColorCollection.princetonOrange,
                    ColorCollection.royalOrange,
                    ColorCollection.rajah,
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                    color: ColorCollection.darkGreen1,
                    offset: const Offset(0, 2.5),
                    blurRadius: 3,
                    blurStyle: BlurStyle.normal,
                  ),
                ],
                image: DecorationImage(
                  image: AssetImage(Assets.pattern1),
                  fit: BoxFit.cover,
                ),
              ),
              child: ElevatedButton(
                onPressed: onRefresh,
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorCollection.transparent,
                  shadowColor: ColorCollection.transparent,
                ),
                child: Text(
                  'Refresh',
                  style: TextStyleCollection.poppinsBold.copyWith(
                    color: ColorCollection.white,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
