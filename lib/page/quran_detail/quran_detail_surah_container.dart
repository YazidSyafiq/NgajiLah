import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ngajilah/constant/assets_constant.dart';
import 'package:ngajilah/constant/color_constant.dart';
import 'package:ngajilah/constant/text_style_constant.dart';
import 'package:ngajilah/provider/quran_provider.dart';
import 'package:ngajilah/widget/loading_widget.dart';
import 'package:provider/provider.dart';

class DetailSurahQuranContainer extends StatelessWidget {
  const DetailSurahQuranContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 24,
        ),
        Container(
          height: 210,
          width: double.infinity,
          margin: const EdgeInsets.symmetric(
            horizontal: 24,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
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
                color: ColorCollection.grey,
                offset: const Offset(0, 2.5),
                blurRadius: 3,
                blurStyle: BlurStyle.normal,
              ),
            ],
            image: DecorationImage(
              image: AssetImage(
                Assets.pattern2,
              ),
              fit: BoxFit.cover,
              opacity: 0.15,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Consumer<QuranProvider>(
              builder: (context, provider, child) {
                if (provider.isLoadingGetAyatBySurah) {
                  return LoadingWidget(
                    color: ColorCollection.white,
                    size: 20,
                  );
                } else {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        provider.detailSurahResponse.data?.namaLatin ?? '-',
                        style: TextStyleCollection.poppinsBold.copyWith(
                          color: ColorCollection.white,
                          fontSize: 24,
                        ),
                      ),
                      Text(
                        '(${provider.detailSurahResponse.data?.arti})',
                        style: TextStyleCollection.poppinsNormal.copyWith(
                          color: ColorCollection.white,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(horizontal: 25),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: ColorCollection.white.withOpacity(
                              0.5,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        '${provider.detailSurahResponse.data?.tempatTurun} - ${provider.detailSurahResponse.data?.jumlahAyat} Ayat',
                        style: TextStyleCollection.poppinsNormal.copyWith(
                          color: ColorCollection.white,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SvgPicture.asset(
                        Assets.bismillahLetter,
                        colorFilter: ColorFilter.mode(
                          ColorCollection.white,
                          BlendMode.srcIn,
                        ),
                        height: 55,
                      )
                    ],
                  );
                }
              },
            ),
          ),
        ),
        const SizedBox(
          height: 24,
        ),
      ],
    );
  }
}
