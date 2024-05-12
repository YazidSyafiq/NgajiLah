import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ngajilah/constant/color_constant.dart';
import 'package:ngajilah/constant/text_style_constant.dart';
import 'package:ngajilah/page/quran_detail/quran_detail_list_ayat_by_juz.dart';
import 'package:ngajilah/page/quran/quran_provider.dart';
import 'package:ngajilah/widget/appbar_widget.dart';
import 'package:ngajilah/widget/error_widget.dart';
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
        child: AppbarWidget(
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
                  provider.detailJuzResponse.data?.juz == null
                      ? '-'
                      : 'Juz ${provider.detailJuzResponse.data?.juz}',
                  style: TextStyleCollection.poppinsBold.copyWith(
                    color: ColorCollection.white,
                    fontSize: 18,
                  ),
                );
              }
            },
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
          } else if (provider.errorGetAyatByJuz != null) {
            return ErrorGlobalWidget(
              errorText: provider.errorGetAyatByJuz!,
              onRefresh: () {
                provider.getAyatByJuz(nomorJuz: widget.nomorJuz);
              },
            );
          } else {
            return const ListAyatByJuz();
          }
        },
      ),
    );
  }
}
