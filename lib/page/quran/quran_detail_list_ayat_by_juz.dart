import 'package:flutter/material.dart';
import 'package:ngajilah/constant/assets_constant.dart';
import 'package:ngajilah/constant/color_constant.dart';
import 'package:ngajilah/constant/text_style_constant.dart';
import 'package:ngajilah/page/quran/quran_provider.dart';
import 'package:ngajilah/utils/nama_surah_by_ayat.dart';
import 'package:provider/provider.dart';

class ListAyatByJuz extends StatelessWidget {
  const ListAyatByJuz({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<QuranProvider>(
      builder: (context, provider, child) {
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                Assets.backgroundSplash,
              ),
              fit: BoxFit.cover,
              opacity: 0.75,
            ),
          ),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: provider.detailJuzResponse.data?.verses?.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                child: Column(
                  children: [
                    Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
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
                      child: Row(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            margin: const EdgeInsets.symmetric(
                              horizontal: 8,
                            ),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                  Assets.frameNomor1,
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                '${provider.detailJuzResponse.data?.verses?[index].number?.inSurah}',
                                style: TextStyleCollection.poppinsBold.copyWith(
                                  color: ColorCollection.white,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                          Text(
                            getNamaSurah(
                              provider.detailJuzResponse.data?.verses?[index]
                                      .number?.inQuran ??
                                  0,
                            ),
                            style: TextStyleCollection.poppinsBold.copyWith(
                              fontSize: 16,
                              color: ColorCollection.darkGreen1,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 8,
                      ),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: ColorCollection.lightGrey2,
                          ),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              provider.detailJuzResponse.data?.verses?[index]
                                      .text?.arab ??
                                  '-',
                              style: TextStyleCollection.lateefArabic,
                              textAlign: TextAlign.right,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Artinya:',
                            style: TextStyleCollection.poppinsBold.copyWith(
                              fontSize: 14,
                              color: ColorCollection.darkGreen1,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            provider.detailJuzResponse.data?.verses?[index]
                                    .translation?.id ??
                                '-',
                            style: TextStyleCollection.poppinsNormal.copyWith(
                              fontSize: 14,
                              color: ColorCollection.darkGreen1,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
