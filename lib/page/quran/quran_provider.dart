import 'package:flutter/material.dart';
import 'package:ngajilah/model/quran_juz_response.dart';
import 'package:ngajilah/model/quran_surah_response.dart';
import 'package:ngajilah/services/quran_service.dart';

class QuranProvider extends ChangeNotifier {
  SurahQuranResponse _surahQuranResponse = SurahQuranResponse();
  SurahQuranResponse get surahQuranResponse => _surahQuranResponse;

  bool _isLoadingGetSurah = false;
  bool get isLoadingGetSurah => _isLoadingGetSurah;

  String? _errorGetSurah;
  String? get errorGetSurah => _errorGetSurah;

  void getSurah() async {
    _isLoadingGetSurah = true;
    _surahQuranResponse = SurahQuranResponse();
    _errorGetSurah = null;
    notifyListeners();
    try {
      final response = await QuranService.getAllSurah();
      _surahQuranResponse = response;
      notifyListeners();
    } catch (e) {
      _errorGetSurah = e.toString();
      notifyListeners();
    } finally {
      _isLoadingGetSurah = false;
      notifyListeners();
    }
  }

  JuzQuranResponse _juzQuranResponse = JuzQuranResponse();
  JuzQuranResponse get juzQuranResponse => _juzQuranResponse;

  bool _isLoadingGetJuz = false;
  bool get isLoadingGetJuz => _isLoadingGetJuz;

  String? _errorGetJuz;
  String? get errorGetJuz => _errorGetJuz;

  void getJuz() async {
    _isLoadingGetJuz = true;
    _juzQuranResponse = JuzQuranResponse();
    _errorGetJuz = null;
    notifyListeners();
    try {
      final response = await QuranService.getAllJuz();
      _juzQuranResponse = response;
      notifyListeners();
    } catch (e) {
      _errorGetJuz = e.toString();
      notifyListeners();
    } finally {
      _isLoadingGetJuz = false;
      notifyListeners();
    }
  }
}
