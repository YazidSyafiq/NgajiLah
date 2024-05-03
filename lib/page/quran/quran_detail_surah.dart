import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ngajilah/constant/assets_constant.dart';
import 'package:ngajilah/constant/color_constant.dart';
import 'package:ngajilah/constant/text_style_constant.dart';
import 'package:ngajilah/page/quran/quran_detail_list_ayat_by_surah.dart';
import 'package:ngajilah/page/quran/quran_detail_surah_container.dart';
import 'package:ngajilah/page/quran/quran_provider.dart';
import 'package:provider/provider.dart';

class DetailSurahPage extends StatefulWidget {
  const DetailSurahPage({
    super.key,
    required this.nomorSurah,
  });
  final String nomorSurah;

  @override
  State<DetailSurahPage> createState() => _DetailSurahPageState();
}

class _DetailSurahPageState extends State<DetailSurahPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        if (mounted) {
          Provider.of<QuranProvider>(context, listen: false).getAyatBySurah(
            nomorSurah: widget.nomorSurah,
          );
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: ColorCollection.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    );
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: Container(
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
              ]),
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
            title: Consumer<QuranProvider>(
              builder: (context, provider, child) {
                if (provider.isLoadingGetAyatBySurah) {
                  return SizedBox(
                    width: 15,
                    height: 15,
                    child: CircularProgressIndicator(
                      color: ColorCollection.white,
                    ),
                  );
                } else {
                  return Text(
                    provider.detailSurahResponse.data?.namaLatin ?? '-',
                    style: TextStyleCollection.poppinsBold.copyWith(
                      color: ColorCollection.white,
                      fontSize: 18,
                    ),
                  );
                }
              },
            ),
            centerTitle: true,
          ),
        ),
      ),
      body: Consumer<QuranProvider>(
        builder: (context, provider, child) {
          if (provider.isLoadingGetAyatBySurah) {
            return Center(
              child: SizedBox(
                width: 30,
                height: 30,
                child: CircularProgressIndicator(
                  color: ColorCollection.darkGreen1,
                ),
              ),
            );
          } else {
            return NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  const SliverToBoxAdapter(
                    child: DetailSurahQuranContainer(),
                  )
                ];
              },
              body: const ListAyatBySurah(),
            );
          }
        },
      ),
    );
  }
}
