import 'package:dio/dio.dart';
import 'package:ngajilah/model/quran_juz_response.dart';
import 'package:ngajilah/model/quran_surah_response.dart';
import 'package:ngajilah/utils/base_url.dart';

class QuranService {
  static Dio dio = Dio();

  static Future<SurahQuranResponse> getAllSurah() async {
    try {
      final response = await dio.get('${BaseUrl.quran}surat/semua/');
      return SurahQuranResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw e.toString();
    }
  }

  static Future<JuzQuranResponse> getAllJuz() async {
    try {
      final response = await dio.get('${BaseUrl.quran}juz/semua/');
      return JuzQuranResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw e.toString();
    }
  }
}
