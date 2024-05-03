import 'package:dio/dio.dart';
import 'package:ngajilah/model/detail_doa_response.dart';
import 'package:ngajilah/model/list_doa_response.dart';
import 'package:ngajilah/utils/base_url.dart';

class DoaService {
  static Dio dio = Dio();

  static Future<ListDoaResponse> getListDoa() async {
    try {
      final response = await dio.get('${BaseUrl.doa}/semua');
      if (response.statusCode == 200) {
        return ListDoaResponse.fromJson(response.data);
      } else {
        throw 'Gagal mendapatkan list doa';
      }
    } on DioException catch (e) {
      throw e.toString();
    }
  }

  static Future<DetailDoaResponse> getDetailDoa({required String idDoa}) async {
    try {
      final response = await dio.get('${BaseUrl.doa}/$idDoa');
      if (response.statusCode == 200) {
        return DetailDoaResponse.fromJson(response.data);
      } else {
        throw 'Gagal mendapatkan list doa';
      }
    } on DioException catch (e) {
      throw e.toString();
    }
  }
}
