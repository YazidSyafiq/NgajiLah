import 'package:flutter/material.dart';
import 'package:ngajilah/constant/assets_constant.dart';
import 'package:ngajilah/constant/color_constant.dart';
import 'package:ngajilah/constant/text_style_constant.dart';
import 'package:ngajilah/provider/tasbih_provider.dart';
import 'package:provider/provider.dart';

class TasbihRefresh extends StatelessWidget {
  const TasbihRefresh({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 125,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: ColorCollection.white,
        image: DecorationImage(
          image: AssetImage(
            Assets.pattern1,
          ),
          fit: BoxFit.cover,
          opacity: 0.3,
        ),
        boxShadow: [
          BoxShadow(
            color: ColorCollection.semiDarkGrey,
            offset: const Offset(0, 3),
            blurRadius: 2,
            blurStyle: BlurStyle.normal,
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: () {
          Provider.of<TasbihProvider>(context, listen: false).refreshTasbih();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorCollection.transparent,
          foregroundColor: ColorCollection.grey,
          shadowColor: ColorCollection.transparent,
        ),
        child: Text(
          'Refresh',
          style: TextStyleCollection.poppinsBold.copyWith(
            color: ColorCollection.darkGreen1,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
