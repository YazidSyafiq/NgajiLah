import 'package:flutter/material.dart';
import 'package:ngajilah/model/detail_doa_response.dart';
import 'package:ngajilah/model/list_doa_response.dart';
import 'package:ngajilah/services/doa_service.dart';

class DoaProvider extends ChangeNotifier {
  ListDoaResponse _listDoaResponse = ListDoaResponse();
  ListDoaResponse get listDoaResponse => _listDoaResponse;

  bool _isLoadingListDoa = false;
  bool get isLoadingListDoa => _isLoadingListDoa;

  String? _errorListDoa;
  String? get errorListDoa => _errorListDoa;

  void getListDoa() async {
    _isLoadingListDoa = true;
    _listDoaResponse = ListDoaResponse();
    _errorListDoa = null;
    notifyListeners();
    try {
      final response = await DoaService.getListDoa();
      _listDoaResponse = response;
      notifyListeners();
    } catch (e) {
      _errorListDoa =
          'Pastikan koneksimu aman dan lancar yaa. Coba refresh terlebih dahulu. Jika belum berhasil, coba lagi nanti yaa.';
      notifyListeners();
    } finally {
      _isLoadingListDoa = false;
      notifyListeners();
    }
  }

  DetailDoaResponse _detailDoaResponse = DetailDoaResponse();
  DetailDoaResponse get detailDoaResponse => _detailDoaResponse;

  bool _isLoadingDetailDoa = false;
  bool get isLoadingDetailDoa => _isLoadingDetailDoa;

  String? _errorDetailDoa;
  String? get errorDetailDoa => _errorDetailDoa;

  void getDetailDoa({required String idDoa}) async {
    _isLoadingDetailDoa = true;
    _detailDoaResponse = DetailDoaResponse();
    _errorDetailDoa = null;
    notifyListeners();
    try {
      final response = await DoaService.getDetailDoa(idDoa: idDoa);
      _detailDoaResponse = response;
      notifyListeners();
    } catch (e) {
      _errorDetailDoa =
          'Pastikan koneksimu aman dan lancar yaa. Coba refresh terlebih dahulu. Jika belum berhasil, coba lagi nanti yaa.';
      notifyListeners();
    } finally {
      _isLoadingDetailDoa = false;
      notifyListeners();
    }
  }
}
