import 'package:flutter/material.dart';
import 'package:ngajilah/model/detail_juz_ayat_response.dart';
import 'package:ngajilah/model/detail_surah_ayat_response.dart';
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

  DetailSurahResponse _detailSurahResponse = DetailSurahResponse();
  DetailSurahResponse get detailSurahResponse => _detailSurahResponse;

  bool _isLoadingGetAyatBySurah = false;
  bool get isLoadingGetAyatBySurah => _isLoadingGetAyatBySurah;

  String? _errorGetAyatBySurah;
  String? get errorGetAyatBySurah => _errorGetAyatBySurah;

  void getAyatBySurah({required String nomorSurah}) async {
    _isLoadingGetAyatBySurah = true;
    _detailSurahResponse = DetailSurahResponse();
    _errorGetAyatBySurah = null;
    notifyListeners();
    try {
      final response = await QuranService.getAyatBySurah(
        nomorSurah: nomorSurah,
      );
      _detailSurahResponse = response;
      notifyListeners();
    } catch (e) {
      _errorGetAyatBySurah = e.toString();
      notifyListeners();
    } finally {
      _isLoadingGetAyatBySurah = false;
      notifyListeners();
    }
  }

  DetailJuzResponse _detailJuzResponse = DetailJuzResponse();
  DetailJuzResponse get detailJuzResponse => _detailJuzResponse;

  bool _isLoadingGetAyatByJuz = false;
  bool get isLoadingGetAyatByJuz => _isLoadingGetAyatByJuz;

  String? _errorGetAyatByJuz;
  String? get errorGetAyatByJuz => _errorGetAyatByJuz;

  void getAyatByJuz({required String nomorJuz}) async {
    _isLoadingGetAyatByJuz = true;
    _detailJuzResponse = DetailJuzResponse();
    _errorGetAyatByJuz = null;
    notifyListeners();
    try {
      final response = await QuranService.getAyatByJuz(
        nomorJuz: nomorJuz,
      );
      _detailJuzResponse = response;
      notifyListeners();
    } catch (e) {
      _errorGetAyatByJuz = e.toString();
      notifyListeners();
    } finally {
      _isLoadingGetAyatByJuz = false;
      notifyListeners();
    }
  }
}
