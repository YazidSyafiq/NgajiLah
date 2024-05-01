import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ngajilah/constant/assets_constant.dart';
import 'package:ngajilah/constant/color_constant.dart';
import 'package:ngajilah/page/home/home_header.dart';
import 'package:ngajilah/page/home/home_jadwal_sholat.dart';
import 'package:ngajilah/page/home/home_menu.dart';
import 'package:ngajilah/page/home/home_page_view_container.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: ColorCollection.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    );
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: ColorCollection.darkGreen1,
          image: DecorationImage(
            image: AssetImage(
              Assets.backgroundSplash,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const HomeHeader(),
              const SizedBox(
                height: 24,
              ),
              const PageViewContainer(),
              const SizedBox(
                height: 24,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: ColorCollection.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                  image: DecorationImage(
                    image: AssetImage(Assets.backgroundSplash),
                    fit: BoxFit.cover,
                  ),
                ),
                child: const Column(
                  children: [
                    HomeMenu(),
                    SizedBox(
                      height: 16,
                    ),
                    HomeJadwalSholat(),
                    SizedBox(
                      height: 24,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
