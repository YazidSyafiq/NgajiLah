import 'package:flutter/material.dart';
import 'package:ngajilah/page/doa/doa_page.dart';
import 'package:ngajilah/page/home/home_page.dart';
import 'package:ngajilah/page/quran/quran_page.dart';
import 'package:ngajilah/page/tasbih/tasbih_page.dart';

class BottomNavbarProvider extends ChangeNotifier {
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  final List<Widget> _optionsPage = [
    const HomePage(),
    const QuranPage(),
    const KumpulanDoaPage(),
    const TasbihPage(),
  ];

  List<Widget> get optionsPage => _optionsPage;

  void getInitialIndex({required int initialIndex}) {
    _selectedIndex = initialIndex;
    notifyListeners();
  }

  void getPageByIndex({required int index}) {
    _selectedIndex = index;
    notifyListeners();
  }
}
