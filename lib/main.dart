import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:ngajilah/constant/gemini_ai.dart';
import 'package:ngajilah/provider/asbabun_provider.dart';
import 'package:ngajilah/provider/bottom_navigation_provider.dart';
import 'package:ngajilah/provider/doa_provider.dart';
import 'package:ngajilah/provider/home_jadwal_sholat_provider.dart';
import 'package:ngajilah/provider/quran_provider.dart';
import 'package:ngajilah/page/splash_page.dart';
import 'package:ngajilah/provider/tasbih_provider.dart';
import 'package:provider/provider.dart';

void main() {
  Gemini.init(apiKey: apiKey);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<JadwalSholatProvider>(
          create: (context) => JadwalSholatProvider(),
        ),
        ChangeNotifierProvider<QuranProvider>(
          create: (context) => QuranProvider(),
        ),
        ChangeNotifierProvider<DoaProvider>(
          create: (context) => DoaProvider(),
        ),
        ChangeNotifierProvider<TasbihProvider>(
          create: (context) => TasbihProvider(),
        ),
        ChangeNotifierProvider<AsbabunProvider>(
          create: (context) => AsbabunProvider(),
        ),
        ChangeNotifierProvider<BottomNavbarProvider>(
          create: (context) => BottomNavbarProvider(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
        ],
        home: SplashPage(),
      ),
    );
  }
}
