import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ngajilah/constant/assets_constant.dart';
import 'package:ngajilah/constant/color_constant.dart';
import 'package:ngajilah/constant/text_style_constant.dart';
import 'package:ngajilah/page/bottom_navigation_bar/bottom_navigation_provider.dart';
import 'package:ngajilah/page/home/home_header.dart';
import 'package:ngajilah/page/home/home_jadwal_sholat.dart';
import 'package:ngajilah/page/home/home_menu.dart';
import 'package:ngajilah/page/home/home_page_view_container.dart';
import 'package:provider/provider.dart';

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
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        int selectedIndex =
            Provider.of<BottomNavbarProvider>(context, listen: false)
                .selectedIndex;
        if (selectedIndex == 0) {
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) {
              return PopScope(
                canPop: false,
                child: AlertDialog(
                  backgroundColor: ColorCollection.white,
                  title: Text(
                    'Exit',
                    style: TextStyleCollection.poppinsBold.copyWith(
                      fontSize: 16,
                      color: ColorCollection.darkGreen1,
                    ),
                  ),
                  content: Text(
                    'Apakah anda yakin ingin keluar dari aplikasi ini?',
                    style: TextStyleCollection.poppinsNormal.copyWith(
                      fontSize: 14,
                      color: ColorCollection.darkGreen1,
                    ),
                  ),
                  actions: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ColorCollection.white,
                            side: BorderSide(
                              color: ColorCollection.darkGreen1,
                            ),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.close,
                                color: ColorCollection.darkGreen1,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Batal',
                                style: TextStyleCollection.poppinsBold.copyWith(
                                  fontSize: 14,
                                  color: ColorCollection.darkGreen1,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            SystemNavigator.pop();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                ColorCollection.bostonUniversityRed,
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.logout,
                                color: ColorCollection.white,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Keluar',
                                style: TextStyleCollection.poppinsBold.copyWith(
                                  fontSize: 14,
                                  color: ColorCollection.white,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        }
      },
      child: Scaffold(
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
                        height: 32,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
