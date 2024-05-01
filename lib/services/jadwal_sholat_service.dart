import 'package:dio/dio.dart';
import 'package:ngajilah/model/jadwal_sholat_response.dart';
import 'package:ngajilah/utils/base_url.dart';

class JadwalSholatService {
  static Dio dio = Dio();

  static Future<JadwalSholatResponse> getJadwalSholat({
    required String date,
    required String latitude,
    required String longitude,
  }) async {
    try {
      final response = await dio.get(
          '${BaseUrl.jadwalSholat}$date?latitude=$latitude&longitude=$longitude&method=2');

      return JadwalSholatResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw e.toString();
    }
  }
}
