import 'package:flutter/material.dart';
import 'package:ngajilah/constant/assets_constant.dart';
import 'package:ngajilah/constant/color_constant.dart';
import 'package:ngajilah/constant/text_style_constant.dart';
import 'package:ngajilah/page/home/home_jadwal_sholat_container.dart';
import 'package:ngajilah/provider/home_jadwal_sholat_provider.dart';
import 'package:ngajilah/widget/loading_widget.dart';
import 'package:provider/provider.dart';

class HomeJadwalSholat extends StatefulWidget {
  const HomeJadwalSholat({super.key});

  @override
  State<HomeJadwalSholat> createState() => _HomeJadwalSholatState();
}

class _HomeJadwalSholatState extends State<HomeJadwalSholat> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        if (mounted) {
          Provider.of<JadwalSholatProvider>(context, listen: false)
              .getSavedAddress();
          Provider.of<JadwalSholatProvider>(context, listen: false)
              .getAddress();
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: ColorCollection.darkGreen1,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: ColorCollection.grey,
            offset: const Offset(0, 3),
            blurRadius: 3,
            blurStyle: BlurStyle.normal,
          ),
        ],
        image: DecorationImage(
          image: AssetImage(Assets.pattern1),
          opacity: 0.1,
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 42,
            width: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Assets.frame),
                fit: BoxFit.cover,
              ),
            ),
            child: ElevatedButton(
              onPressed: () {
                Provider.of<JadwalSholatProvider>(context, listen: false)
                    .getAddress();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorCollection.transparent,
                shadowColor: ColorCollection.transparent,
              ),
              child: Consumer<JadwalSholatProvider>(
                builder: (context, provider, child) {
                  provider.getSavedAddress();
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.location_on,
                        color: ColorCollection.white,
                        size: 20,
                      ),
                      Flexible(
                        child: provider.isLoading
                            ? LoadingWidget(
                                color: ColorCollection.mellowApricot,
                                size: 15,
                              )
                            : Text(
                                provider.savedAddress ?? 'Cari Lokasi',
                                style: TextStyleCollection.poppinsBold.copyWith(
                                  fontSize: 14,
                                  color: ColorCollection.white,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            'Jadwal Sholat Hari Ini',
            style: TextStyleCollection.poppinsBold.copyWith(
              color: ColorCollection.mellowApricot,
              fontSize: 16,
            ),
          ),
          Consumer<JadwalSholatProvider>(
            builder: (context, provider, child) {
              if (provider.isLoadingToday || provider.isLoading) {
                return LoadingWidget(
                  color: ColorCollection.mellowApricot,
                  size: 15,
                );
              } else if (provider.errorToday != null) {
                return IconButton(
                  onPressed: () {
                    provider.getCurrentDate();
                  },
                  icon: const Icon(Icons.refresh),
                  color: ColorCollection.white,
                );
              } else {
                return Text(
                  provider.today ?? '-',
                  style: TextStyleCollection.poppinsNormal.copyWith(
                    color: ColorCollection.white,
                    fontSize: 13,
                  ),
                );
              }
            },
          ),
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Consumer<JadwalSholatProvider>(
              builder: (context, provider, child) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ContainerWaktuSholat(
                      assetsIcon: IconMenu.sholatSubuh,
                      label: 'Subuh',
                      isLoading: provider.isLoading,
                      isLoadingSholat: provider.isLoadingSholat,
                      waktuSholat: provider.subuh,
                    ),
                    ContainerWaktuSholat(
                      assetsIcon: IconMenu.sholatDzuhur,
                      label: 'Dzuhur',
                      isLoading: provider.isLoading,
                      isLoadingSholat: provider.isLoadingSholat,
                      waktuSholat: provider.dzuhur,
                    ),
                    ContainerWaktuSholat(
                      assetsIcon: IconMenu.sholatAshar,
                      label: 'Ashar',
                      isLoading: provider.isLoading,
                      isLoadingSholat: provider.isLoadingSholat,
                      waktuSholat: provider.ashar,
                    ),
                    ContainerWaktuSholat(
                      assetsIcon: IconMenu.sholatMaghrib,
                      label: 'Maghrib',
                      isLoading: provider.isLoading,
                      isLoadingSholat: provider.isLoadingSholat,
                      waktuSholat: provider.maghrib,
                    ),
                    ContainerWaktuSholat(
                      assetsIcon: IconMenu.sholatIsya,
                      label: 'Isya',
                      isLoading: provider.isLoading,
                      isLoadingSholat: provider.isLoadingSholat,
                      waktuSholat: provider.isya,
                    ),
                  ],
                );
              },
            ),
          ),
          const SizedBox(
            height: 20,
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
                Provider.of<JadwalSholatProvider>(context, listen: false)
                    .getAddress();
                Provider.of<JadwalSholatProvider>(context, listen: false)
                    .getJadwalSholat();
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
    );
  }
}
