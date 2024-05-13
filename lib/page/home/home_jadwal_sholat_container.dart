import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ngajilah/constant/color_constant.dart';
import 'package:ngajilah/constant/text_style_constant.dart';
import 'package:ngajilah/widget/loading_widget.dart';

class ContainerWaktuSholat extends StatelessWidget {
  const ContainerWaktuSholat({
    super.key,
    required this.waktuSholat,
    required this.label,
    required this.isLoading,
    required this.isLoadingSholat,
    required this.assetsIcon,
  });

  final String? waktuSholat;
  final String label;
  final bool isLoading;
  final bool isLoadingSholat;
  final String assetsIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 65,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: ColorCollection.mellowApricot,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          isLoadingSholat || isLoading
              ? LoadingWidget(
                  color: ColorCollection.mellowApricot,
                  size: 15,
                )
              : waktuSholat == null
                  ? Icon(
                      Icons.refresh,
                      color: ColorCollection.white,
                    )
                  : Text(
                      waktuSholat!,
                      style: TextStyleCollection.poppinsNormal.copyWith(
                        color: ColorCollection.white,
                        fontSize: 16,
                      ),
                    ),
          SvgPicture.asset(
            assetsIcon,
            width: 37.5,
            height: 37.5,
            colorFilter: ColorFilter.mode(
              ColorCollection.mellowApricot,
              BlendMode.srcIn,
            ),
          ),
          Text(
            label,
            style: TextStyleCollection.poppinsBold.copyWith(
              color: ColorCollection.white,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
