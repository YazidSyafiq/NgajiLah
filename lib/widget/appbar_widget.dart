import 'package:flutter/material.dart';
import 'package:ngajilah/constant/assets_constant.dart';
import 'package:ngajilah/constant/color_constant.dart';

class AppbarWidget extends StatelessWidget {
  const AppbarWidget({
    super.key,
    required this.title,
  });

  final Widget title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.bottomRight,
          stops: const [0.2, 0.45, 0.6, 0.7, 0.8, 0.9, 0.95],
          colors: [
            ColorCollection.darkGreen1,
            ColorCollection.blueGreen,
            ColorCollection.castletonGreen,
            ColorCollection.bangladeshGreen,
            ColorCollection.bangladeshGreen1,
            ColorCollection.spanishViridian,
            ColorCollection.genericViridian,
          ],
        ),
        image: DecorationImage(
          image: AssetImage(Assets.pattern2),
          fit: BoxFit.cover,
          opacity: 0.05,
        ),
        boxShadow: [
          BoxShadow(
            color: ColorCollection.darkGreen1,
            offset: const Offset(0, 2),
            blurRadius: 5,
            blurStyle: BlurStyle.normal,
          )
        ],
      ),
      child: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: ColorCollection.white,
          ),
        ),
        backgroundColor: ColorCollection.transparent,
        title: title,
        centerTitle: true,
      ),
    );
  }
}
