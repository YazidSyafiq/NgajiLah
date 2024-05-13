import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ngajilah/constant/color_constant.dart';
import 'package:ngajilah/constant/text_style_constant.dart';
import 'package:ngajilah/page/quran_detail/quran_detail_list_ayat_by_surah.dart';
import 'package:ngajilah/page/quran_detail/quran_detail_surah_container.dart';
import 'package:ngajilah/provider/quran_provider.dart';
import 'package:ngajilah/widget/appbar_widget.dart';
import 'package:ngajilah/widget/error_widget.dart';
import 'package:ngajilah/widget/loading_widget.dart';
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
        child: AppbarWidget(
          title: Consumer<QuranProvider>(
            builder: (context, provider, child) {
              if (provider.isLoadingGetAyatBySurah) {
                return LoadingWidget(
                  color: ColorCollection.white,
                  size: 15,
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
        ),
      ),
      body: Consumer<QuranProvider>(
        builder: (context, provider, child) {
          if (provider.isLoadingGetAyatBySurah) {
            return Center(
              child: LoadingWidget(
                color: ColorCollection.darkGreen1,
                size: 30,
              ),
            );
          } else if (provider.errorGetAyatBySurah != null) {
            return ErrorGlobalWidget(
              errorText: provider.errorGetAyatBySurah!,
              onRefresh: () {
                provider.getAyatBySurah(nomorSurah: widget.nomorSurah);
              },
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
