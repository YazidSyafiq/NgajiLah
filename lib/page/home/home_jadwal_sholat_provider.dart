import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:ngajilah/model/jadwal_sholat_response.dart';
import 'package:ngajilah/services/geolocator_service.dart';
import 'package:ngajilah/services/jadwal_sholat_service.dart';
import 'package:ngajilah/utils/shared_pref_utils.dart';

class JadwalSholatProvider extends ChangeNotifier {
  Position? _currentPosition;
  Position? get currentPosition => _currentPosition;

  String _currentAddress = '';
  String get currentAddress => _currentAddress;

  String? _savedAddress;
  String? get savedAddress => _savedAddress;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isLoadingSholat = false;
  bool get isLoadingSholat => _isLoadingSholat;

  final DateTime _currentDate = DateTime.now();
  DateTime get currentDate => _currentDate;

  void getAddress() async {
    _isLoading = true;
    notifyListeners();
    try {
      _currentPosition = await GeolocatorService().getCurrentLocation();
      List<Placemark> placemark = await placemarkFromCoordinates(
        _currentPosition!.latitude,
        _currentPosition!.longitude,
      );
      Placemark place = placemark[0];
      _currentAddress = '${place.subLocality}';
      SharedPref.saveAddress(address: _currentAddress);
      getJadwalSholat();
      notifyListeners();
    } catch (e) {
      e.toString();
      notifyListeners();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void getSavedAddress() async {
    _savedAddress = await SharedPref.getAddress();
    notifyListeners();
  }

  String getCurrentDate() {
    String today = DateFormat('dd MMMM yyyy', 'id_ID').format(_currentDate);

    return today;
  }

  String getFormatCurrentDate() {
    String formatToday = DateFormat('dd-MM-yyyy').format(_currentDate);

    return formatToday;
  }

  JadwalSholatResponse _jadwalSholat = JadwalSholatResponse();
  JadwalSholatResponse get jadwalSholat => _jadwalSholat;

  String? _errorGetJadwal;
  String? get errorGetJadwal => _errorGetJadwal;

  void getJadwalSholat() async {
    _isLoadingSholat = true;
    _jadwalSholat = JadwalSholatResponse();
    _errorGetJadwal = null;
    notifyListeners();
    try {
      final latitude = _currentPosition!.latitude;
      final longitude = _currentPosition!.latitude;

      final response = await JadwalSholatService.getJadwalSholat(
        date: getFormatCurrentDate(),
        latitude: latitude.toString(),
        longitude: longitude.toString(),
      );

      if (response.data == null || response.data?.timings == null) {
        _errorGetJadwal = "Data jadwal sholat tidak ditemukan";
      } else {
        _jadwalSholat = response;
      }
      notifyListeners();
    } catch (e) {
      _errorGetJadwal = e.toString();
      notifyListeners();
    } finally {
      _isLoadingSholat = false;
      notifyListeners();
    }
  }
}
