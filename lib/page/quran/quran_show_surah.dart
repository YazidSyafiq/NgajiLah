import 'package:flutter/material.dart';
import 'package:ngajilah/constant/assets_constant.dart';
import 'package:ngajilah/constant/color_constant.dart';
import 'package:ngajilah/constant/text_style_constant.dart';
import 'package:ngajilah/page/quran/quran_provider.dart';
import 'package:provider/provider.dart';

class ShowSurah extends StatefulWidget {
  const ShowSurah({super.key});

  @override
  State<ShowSurah> createState() => _ShowSurahState();
}

class _ShowSurahState extends State<ShowSurah> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        if (mounted) {
          Provider.of<QuranProvider>(context, listen: false).getSurah();
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<QuranProvider>(
      builder: (context, provider, child) {
        if (provider.isLoadingGetSurah) {
          return Center(
            child: SizedBox(
              width: 30,
              height: 30,
              child: CircularProgressIndicator(
                color: ColorCollection.darkGreen,
              ),
            ),
          );
        } else if (provider.errorGetSurah != null) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    'Error : ${provider.errorGetSurah}',
                    style: TextStyleCollection.poppinsNormal.copyWith(
                      fontSize: 14,
                      color: ColorCollection.darkGreen1,
                    ),
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
                      onPressed: () {
                        provider.getSurah();
                      },
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
        } else {
          return ListView.builder(
            itemCount: provider.surahQuranResponse.data?.length ?? 0,
            itemBuilder: (context, index) {
              var data = provider.surahQuranResponse.data?[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 100,
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
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
                        opacity: 0.1,
                      ),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                  Assets.frameNomor,
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                data?.number ?? '-',
                                style: TextStyleCollection.poppinsBold.copyWith(
                                  fontSize: 14,
                                  color: ColorCollection.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data?.nameId ?? '-',
                                style: TextStyleCollection.poppinsBold.copyWith(
                                  color: ColorCollection.white,
                                  fontSize: 16,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Text(
                                    data?.revelationId ?? '-',
                                    style: TextStyleCollection.poppinsNormal
                                        .copyWith(
                                      color: ColorCollection.white,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    width: 4,
                                    height: 4,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(2),
                                      color: ColorCollection.white,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    '${data?.numberOfVerses} Ayat',
                                    style: TextStyleCollection.poppinsNormal
                                        .copyWith(
                                      color: ColorCollection.white,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Text(
                          data?.nameShort ?? '-',
                          style: TextStyle(
                            color: ColorCollection.white,
                            fontSize: 20,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }
}
