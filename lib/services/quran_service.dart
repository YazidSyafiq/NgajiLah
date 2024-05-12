import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ngajilah/model/detail_juz_ayat_response.dart';
import 'package:ngajilah/model/detail_surah_ayat_response.dart';
import 'package:ngajilah/model/quran_juz_response.dart';
import 'package:ngajilah/model/quran_surah_response.dart';
import 'package:ngajilah/utils/base_url.dart';

class QuranService {
  static Dio dio = Dio();

  static Future<SurahQuranResponse> getAllSurah() async {
    try {
      final response = await dio.get(BaseUrl.surah);
      if (response.statusCode == 200) {
        return SurahQuranResponse.fromJson(response.data);
      } else {
        throw Exception('Gagal get surah');
      }
    } on DioException catch (e) {
      throw e.toString();
    }
  }

  static Future<JuzQuranResponse> getAllJuz() async {
    try {
      final response = await dio.get('${BaseUrl.juz}/juz/semua/');
      if (response.statusCode == 200) {
        return JuzQuranResponse.fromJson(response.data);
      } else {
        throw Exception('Gagal get surah');
      }
    } on DioException catch (e) {
      throw e.toString();
    }
  }

  static Future<DetailSurahResponse> getAyatBySurah(
      {required String nomorSurah}) async {
    try {
      final response = await dio.get('${BaseUrl.surah}/$nomorSurah');
      if (response.statusCode == 200) {
        return DetailSurahResponse.fromJson(response.data);
      } else {
        throw Exception('Gagal get surah');
      }
    } on DioException catch (e) {
      throw e.toString();
    }
  }

  static Future<DetailJuzResponse> getAyatByJuz(
      {required String nomorJuz}) async {
    try {
      final response = await dio.get('${BaseUrl.detailJuz}/$nomorJuz');
      if (response.statusCode == 200) {
        if (response.data is String) {
          Map<String, dynamic> jsonResponse = json.decode(response.data);
          return DetailJuzResponse.fromJson(jsonResponse);
        } else if (response.data is Map<String, dynamic>) {
          return DetailJuzResponse.fromJson(response.data);
        } else {
          throw Exception('Unknown response type');
        }
      } else {
        throw Exception('Gagal get surah');
      }
    } on DioException catch (e) {
      throw e.toString();
    }
  }
}
