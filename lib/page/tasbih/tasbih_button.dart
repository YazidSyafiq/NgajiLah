import 'package:flutter/material.dart';
import 'package:ngajilah/constant/color_constant.dart';
import 'package:ngajilah/page/tasbih/tasbih_provider.dart';
import 'package:provider/provider.dart';

class ButtonTasbih extends StatelessWidget {
  const ButtonTasbih({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 75,
      height: 75,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        gradient: LinearGradient(
          colors: [
            ColorCollection.vividOrange,
            ColorCollection.royalOrange,
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: ColorCollection.grey,
            offset: const Offset(0, 1),
            blurRadius: 1.5,
            blurStyle: BlurStyle.normal,
          )
        ],
      ),
      child: FloatingActionButton(
        onPressed: () {
          Provider.of<TasbihProvider>(context, listen: false)
              .addTasbihCounter();
        },
        backgroundColor: ColorCollection.transparent,
        foregroundColor: ColorCollection.transparent,
        focusColor: ColorCollection.transparent,
        focusElevation: 0,
        elevation: 0,
        shape: const CircleBorder(
          side: BorderSide.none,
        ),
        child: Icon(
          Icons.add,
          color: ColorCollection.white,
        ),
      ),
    );
  }
}
