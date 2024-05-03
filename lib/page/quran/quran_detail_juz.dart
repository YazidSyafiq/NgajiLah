import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ngajilah/constant/assets_constant.dart';
import 'package:ngajilah/constant/color_constant.dart';
import 'package:ngajilah/constant/text_style_constant.dart';
import 'package:ngajilah/page/quran/quran_detail_list_ayat_by_juz.dart';
import 'package:ngajilah/page/quran/quran_provider.dart';
import 'package:provider/provider.dart';

class DetailJuzPage extends StatefulWidget {
  const DetailJuzPage({
    super.key,
    required this.nomorJuz,
  });

  final String nomorJuz;

  @override
  State<DetailJuzPage> createState() => _DetailJuzPageState();
}

class _DetailJuzPageState extends State<DetailJuzPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        if (mounted) {
          Provider.of<QuranProvider>(context, listen: false).getAyatByJuz(
            nomorJuz: widget.nomorJuz,
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
                if (provider.isLoadingGetAyatByJuz) {
                  return SizedBox(
                    width: 15,
                    height: 15,
                    child: CircularProgressIndicator(
                      color: ColorCollection.white,
                    ),
                  );
                } else {
                  return Text(
                    'Juz ${provider.detailJuzResponse.data?.juz}',
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
          if (provider.isLoadingGetAyatByJuz) {
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
            return const ListAyatByJuz();
          }
        },
      ),
    );
  }
}
