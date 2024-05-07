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

  String _currentProvince = '';
  String get currentProvince => _currentProvince;

  String _currentAddress = '';
  String get currentAddress => _currentAddress;

  String? _savedAddress;
  String? get savedAddress => _savedAddress;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isLoadingSholat = false;
  bool get isLoadingSholat => _isLoadingSholat;

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
      _currentProvince = '${place.administrativeArea}';
      _currentAddress = '${place.subLocality}';
      SharedPref.saveAddress(address: _currentAddress);
      getCurrentDate();
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

  String? _today;
  String? get today => _today;

  String? _formatToday;
  String? get formatToday => _formatToday;

  String? _errorToday;
  String? get errorToday => _errorToday;

  bool _isLoadingToday = false;
  bool get isLoadingToday => _isLoadingToday;

  final DateTime _currentDate = DateTime.now();
  DateTime get currentDate => _currentDate;

  void getCurrentDate() {
    _isLoadingToday = true;
    _today = null;
    notifyListeners();
    try {
      _today = DateFormat('dd MMMM yyyy', 'id_ID').format(_currentDate);
      _formatToday = DateFormat('dd-MM-yyyy').format(_currentDate);
      notifyListeners();
    } catch (e) {
      _errorToday = e.toString();
      notifyListeners();
    } finally {
      _isLoadingToday = false;
      notifyListeners();
    }
  }

  JadwalSholatResponse _jadwalSholat = JadwalSholatResponse();
  JadwalSholatResponse get jadwalSholat => _jadwalSholat;

  String? _errorGetJadwal;
  String? get errorGetJadwal => _errorGetJadwal;

  String? _subuh;
  String? get subuh => _subuh;

  String? _dzuhur;
  String? get dzuhur => _dzuhur;

  String? _ashar;
  String? get ashar => _ashar;

  String? _maghrib;
  String? get maghrib => _maghrib;

  String? _isya;
  String? get isya => _isya;

  //Fungsi penyesuaian waktu sholat
  String adjustTime(String time, int minutes, DateFormat dateFormat) {
    DateTime timeObj = dateFormat.parse(time);
    DateTime adjustedTime = timeObj.add(Duration(minutes: minutes));
    return dateFormat.format(adjustedTime);
  }

  void getJadwalSholat() async {
    _isLoadingSholat = true;
    _jadwalSholat = JadwalSholatResponse();
    _errorGetJadwal = null;
    _subuh = null;
    _dzuhur = null;
    _ashar = null;
    _maghrib = null;
    _isya = null;
    notifyListeners();
    try {
      final latitude = _currentPosition!.latitude;
      final longitude = _currentPosition!.latitude;

      final response = await JadwalSholatService.getJadwalSholat(
        date: _formatToday!,
        latitude: latitude.toString(),
        longitude: longitude.toString(),
      );

      if (response.data == null || response.data?.timings == null) {
        _errorGetJadwal = "Data jadwal sholat tidak ditemukan";
      } else {
        _jadwalSholat = response;

        final timings = _jadwalSholat.data?.timings;
        final dateFormat = DateFormat('HH:mm');

        if (_currentProvince == 'Lampung') {
          _subuh = adjustTime(timings?.fajr ?? '-', -40, dateFormat);
          _dzuhur = adjustTime(timings?.dhuhr ?? '-', -18, dateFormat);
          _ashar = adjustTime(timings?.asr ?? '-', -20, dateFormat);
          _maghrib = adjustTime(timings?.maghrib ?? '-', -19, dateFormat);
          _isya = adjustTime(timings?.isha ?? '-', -6, dateFormat);
        } else if (_currentProvince == 'Sumatera Selatan' ||
            _currentProvince == 'South Sumatra') {
          _subuh = adjustTime(timings?.fajr ?? '-', -27, dateFormat);
          _dzuhur = adjustTime(timings?.dhuhr ?? '-', -7, dateFormat);
          _ashar = adjustTime(timings?.asr ?? '-', -7, dateFormat);
          _maghrib = adjustTime(timings?.maghrib ?? '-', -8, dateFormat);
          _isya = adjustTime(timings?.isha ?? '-', 4, dateFormat);
        } else if (_currentProvince == 'Aceh') {
          _subuh = adjustTime(timings?.fajr ?? '-', -20, dateFormat);
          _dzuhur = adjustTime(timings?.dhuhr ?? '-', 1, dateFormat);
          _ashar = adjustTime(timings?.asr ?? '-', 0, dateFormat);
          _maghrib = adjustTime(timings?.maghrib ?? '-', 0, dateFormat);
          _isya = adjustTime(timings?.isha ?? '-', 13, dateFormat);
        } else if (_currentProvince == 'North Sumatra' ||
            _currentProvince == 'Sumatera Utara') {
          _subuh = adjustTime(timings?.fajr ?? '-', 18, dateFormat);
          _dzuhur = adjustTime(timings?.dhuhr ?? '-', 40, dateFormat);
          _ashar = adjustTime(timings?.asr ?? '-', 39, dateFormat);
          _maghrib = adjustTime(timings?.maghrib ?? '-', 40, dateFormat);
          _isya = adjustTime(timings?.isha ?? '-', 52, dateFormat);
        } else if (_currentProvince == 'West Sumatra') {
          _subuh = adjustTime(timings?.fajr ?? '-', -6, dateFormat);
          _dzuhur = adjustTime(timings?.dhuhr ?? '-', 15, dateFormat);
          _ashar = adjustTime(timings?.asr ?? '-', 14, dateFormat);
          _maghrib = adjustTime(timings?.maghrib ?? '-', 4, dateFormat);
          _isya = adjustTime(timings?.isha ?? '-', 27, dateFormat);
        } else if (_currentProvince == 'West Sumatra' ||
            _currentProvince == 'Sumatera Barat') {
          _subuh = adjustTime(timings?.fajr ?? '-', -6, dateFormat);
          _dzuhur = adjustTime(timings?.dhuhr ?? '-', 15, dateFormat);
          _ashar = adjustTime(timings?.asr ?? '-', 14, dateFormat);
          _maghrib = adjustTime(timings?.maghrib ?? '-', 4, dateFormat);
          _isya = adjustTime(timings?.isha ?? '-', 27, dateFormat);
        } else if (_currentProvince == 'Riau') {
          _subuh = adjustTime(timings?.fajr ?? '-', -6, dateFormat);
          _dzuhur = adjustTime(timings?.dhuhr ?? '-', 15, dateFormat);
          _ashar = adjustTime(timings?.asr ?? '-', 14, dateFormat);
          _maghrib = adjustTime(timings?.maghrib ?? '-', 14, dateFormat);
          _isya = adjustTime(timings?.isha ?? '-', 26, dateFormat);
        } else if (_currentProvince == 'Kepulauan Riau' ||
            _currentProvince == 'Riau Islands') {
          _subuh = adjustTime(timings?.fajr ?? '-', -15, dateFormat);
          _dzuhur = adjustTime(timings?.dhuhr ?? '-', 6, dateFormat);
          _ashar = adjustTime(timings?.asr ?? '-', 6, dateFormat);
          _maghrib = adjustTime(timings?.maghrib ?? '-', 6, dateFormat);
          _isya = adjustTime(timings?.isha ?? '-', 18, dateFormat);
        } else if (_currentProvince == 'Jambi') {
          _subuh = adjustTime(timings?.fajr ?? '-', -14, dateFormat);
          _dzuhur = adjustTime(timings?.dhuhr ?? '-', 8, dateFormat);
          _ashar = adjustTime(timings?.asr ?? '-', 7, dateFormat);
          _maghrib = adjustTime(timings?.maghrib ?? '-', 9, dateFormat);
          _isya = adjustTime(timings?.isha ?? '-', 21, dateFormat);
        } else if (_currentProvince == 'Kepulauan Bangka Belitung' ||
            _currentProvince == 'Bangka Belitung Islands') {
          _subuh = adjustTime(timings?.fajr ?? '-', -34, dateFormat);
          _dzuhur = adjustTime(timings?.dhuhr ?? '-', -14, dateFormat);
          _ashar = adjustTime(timings?.asr ?? '-', -14, dateFormat);
          _maghrib = adjustTime(timings?.maghrib ?? '-', -14, dateFormat);
          _isya = adjustTime(timings?.isha ?? '-', -1, dateFormat);
        } else if (_currentProvince == 'Bengkulu') {
          _subuh = adjustTime(timings?.fajr ?? '-', -26, dateFormat);
          _dzuhur = adjustTime(timings?.dhuhr ?? '-', -4, dateFormat);
          _ashar = adjustTime(timings?.asr ?? '-', -5, dateFormat);
          _maghrib = adjustTime(timings?.maghrib ?? '-', -5, dateFormat);
          _isya = adjustTime(timings?.isha ?? '-', 8, dateFormat);
        } else if (_currentProvince == 'Banten') {
          _subuh = adjustTime(timings?.fajr ?? '-', -49, dateFormat);
          _dzuhur = adjustTime(timings?.dhuhr ?? '-', -29, dateFormat);
          _ashar = adjustTime(timings?.asr ?? '-', -29, dateFormat);
          _maghrib = adjustTime(timings?.maghrib ?? '-', -29, dateFormat);
          _isya = adjustTime(timings?.isha ?? '-', -16, dateFormat);
        } else if (_currentProvince == 'Jakarta') {
          _subuh = adjustTime(timings?.fajr ?? '-', -53, dateFormat);
          _dzuhur = adjustTime(timings?.dhuhr ?? '-', -32, dateFormat);
          _ashar = adjustTime(timings?.asr ?? '-', -33, dateFormat);
          _maghrib = adjustTime(timings?.maghrib ?? '-', -32, dateFormat);
          _isya = adjustTime(timings?.isha ?? '-', -20, dateFormat);
        } else if (_currentProvince == 'West Java' ||
            _currentProvince == 'Jawa Barat') {
          _subuh = adjustTime(timings?.fajr ?? '-', -60, dateFormat);
          _dzuhur = adjustTime(timings?.dhuhr ?? '-', -39, dateFormat);
          _ashar = adjustTime(timings?.asr ?? '-', -39, dateFormat);
          _maghrib = adjustTime(timings?.maghrib ?? '-', -39, dateFormat);
          _isya = adjustTime(timings?.isha ?? '-', -26, dateFormat);
        } else if (_currentProvince == 'Central Java' ||
            _currentProvince == 'Jawa Tengah') {
          _subuh = adjustTime(timings?.fajr ?? '-', -14, dateFormat);
          _dzuhur = adjustTime(timings?.dhuhr ?? '-', 6, dateFormat);
          _ashar = adjustTime(timings?.asr ?? '-', 6, dateFormat);
          _maghrib = adjustTime(timings?.maghrib ?? '-', 6, dateFormat);
          _isya = adjustTime(timings?.isha ?? '-', 19, dateFormat);
        } else if (_currentProvince == 'East Java' ||
            _currentProvince == 'Jawa Timur') {
          _subuh = adjustTime(timings?.fajr ?? '-', -17, dateFormat);
          _dzuhur = adjustTime(timings?.dhuhr ?? '-', 3, dateFormat);
          _ashar = adjustTime(timings?.asr ?? '-', 3, dateFormat);
          _maghrib = adjustTime(timings?.maghrib ?? '-', 3, dateFormat);
          _isya = adjustTime(timings?.isha ?? '-', 16, dateFormat);
        } else if (_currentProvince == 'Bali') {
          _subuh = adjustTime(timings?.fajr ?? '-', 25, dateFormat);
          _dzuhur = adjustTime(timings?.dhuhr ?? '-', 46, dateFormat);
          _ashar = adjustTime(timings?.asr ?? '-', 45, dateFormat);
          _maghrib = adjustTime(timings?.maghrib ?? '-', 46, dateFormat);
          _isya = adjustTime(timings?.isha ?? '-', 58, dateFormat);
        } else if (_currentProvince == 'West Nusa Tenggara' ||
            _currentProvince == 'Nusa Tenggara Barat') {
          _subuh = adjustTime(timings?.fajr ?? '-', 15, dateFormat);
          _dzuhur = adjustTime(timings?.dhuhr ?? '-', 36, dateFormat);
          _ashar = adjustTime(timings?.asr ?? '-', 36, dateFormat);
          _maghrib = adjustTime(timings?.maghrib ?? '-', 36, dateFormat);
          _isya = adjustTime(timings?.isha ?? '-', 48, dateFormat);
        } else if (_currentProvince == 'East Nusa Tenggara' ||
            _currentProvince == 'Nusa Tenggara Timur') {
          _subuh = adjustTime(timings?.fajr ?? '-', 0, dateFormat);
          _dzuhur = adjustTime(timings?.dhuhr ?? '-', 22, dateFormat);
          _ashar = adjustTime(timings?.asr ?? '-', 21, dateFormat);
          _maghrib = adjustTime(timings?.maghrib ?? '-', 21, dateFormat);
          _isya = adjustTime(timings?.isha ?? '-', 34, dateFormat);
        } else if (_currentProvince == 'West Kalimantan' ||
            _currentProvince == 'Kalimantan Barat') {
          _subuh = adjustTime(timings?.fajr ?? '-', -48, dateFormat);
          _dzuhur = adjustTime(timings?.dhuhr ?? '-', -27, dateFormat);
          _ashar = adjustTime(timings?.asr ?? '-', -27, dateFormat);
          _maghrib = adjustTime(timings?.maghrib ?? '-', -27, dateFormat);
          _isya = adjustTime(timings?.isha ?? '-', -14, dateFormat);
        } else if (_currentProvince == 'Central Kalimantan' ||
            _currentProvince == 'Kalimantan Tengah') {
          _subuh = adjustTime(timings?.fajr ?? '-', -62, dateFormat);
          _dzuhur = adjustTime(timings?.dhuhr ?? '-', -40, dateFormat);
          _ashar = adjustTime(timings?.asr ?? '-', -41, dateFormat);
          _maghrib = adjustTime(timings?.maghrib ?? '-', -41, dateFormat);
          _isya = adjustTime(timings?.isha ?? '-', -28, dateFormat);
        } else if (_currentProvince == 'North Kalimantan' ||
            _currentProvince == 'Kalimantan Utara') {
          _subuh = adjustTime(timings?.fajr ?? '-', 8, dateFormat);
          _dzuhur = adjustTime(timings?.dhuhr ?? '-', 28, dateFormat);
          _ashar = adjustTime(timings?.asr ?? '-', 28, dateFormat);
          _maghrib = adjustTime(timings?.maghrib ?? '-', 28, dateFormat);
          _isya = adjustTime(timings?.isha ?? '-', 41, dateFormat);
        } else if (_currentProvince == 'East Kalimantan' ||
            _currentProvince == 'Kalimantan Timur') {
          _subuh = adjustTime(timings?.fajr ?? '-', -5, dateFormat);
          _dzuhur = adjustTime(timings?.dhuhr ?? '-', 17, dateFormat);
          _ashar = adjustTime(timings?.asr ?? '-', 16, dateFormat);
          _maghrib = adjustTime(timings?.maghrib ?? '-', 16, dateFormat);
          _isya = adjustTime(timings?.isha ?? '-', 29, dateFormat);
        } else if (_currentProvince == 'South Kalimantan' ||
            _currentProvince == 'Kalimantan Selatan') {
          _subuh = adjustTime(timings?.fajr ?? '-', -14, dateFormat);
          _dzuhur = adjustTime(timings?.dhuhr ?? '-', 6, dateFormat);
          _ashar = adjustTime(timings?.asr ?? '-', 6, dateFormat);
          _maghrib = adjustTime(timings?.maghrib ?? '-', 6, dateFormat);
          _isya = adjustTime(timings?.isha ?? '-', 19, dateFormat);
        } else if (_currentProvince == 'South Sulawesi' ||
            _currentProvince == 'Sulawesi Selatan') {
          _subuh = adjustTime(timings?.fajr ?? '-', -40, dateFormat);
          _dzuhur = adjustTime(timings?.dhuhr ?? '-', -18, dateFormat);
          _ashar = adjustTime(timings?.asr ?? '-', -19, dateFormat);
          _maghrib = adjustTime(timings?.maghrib ?? '-', -18, dateFormat);
          _isya = adjustTime(timings?.isha ?? '-', -6, dateFormat);
        } else if (_currentProvince == 'North Sulawesi' ||
            _currentProvince == 'Sulawesi Utara') {
          _subuh = adjustTime(timings?.fajr ?? '-', -34, dateFormat);
          _dzuhur = adjustTime(timings?.dhuhr ?? '-', -13, dateFormat);
          _ashar = adjustTime(timings?.asr ?? '-', -14, dateFormat);
          _maghrib = adjustTime(timings?.maghrib ?? '-', -13, dateFormat);
          _isya = adjustTime(timings?.isha ?? '-', -1, dateFormat);
        } else if (_currentProvince == 'Central Sulawesi' ||
            _currentProvince == 'Sulawesi Tengah') {
          _subuh = adjustTime(timings?.fajr ?? '-', -32, dateFormat);
          _dzuhur = adjustTime(timings?.dhuhr ?? '-', -11, dateFormat);
          _ashar = adjustTime(timings?.asr ?? '-', -12, dateFormat);
          _maghrib = adjustTime(timings?.maghrib ?? '-', -12, dateFormat);
          _isya = adjustTime(timings?.isha ?? '-', 1, dateFormat);
        } else if (_currentProvince == 'West Sulawesi' ||
            _currentProvince == 'Sulawesi Barat') {
          _subuh = adjustTime(timings?.fajr ?? '-', -30, dateFormat);
          _dzuhur = adjustTime(timings?.dhuhr ?? '-', -8, dateFormat);
          _ashar = adjustTime(timings?.asr ?? '-', -9, dateFormat);
          _maghrib = adjustTime(timings?.maghrib ?? '-', -8, dateFormat);
          _isya = adjustTime(timings?.isha ?? '-', 4, dateFormat);
        } else if (_currentProvince == 'South East Sulawesi' ||
            _currentProvince == 'Sulawesi Tenggara') {
          _subuh = adjustTime(timings?.fajr ?? '-', -46, dateFormat);
          _dzuhur = adjustTime(timings?.dhuhr ?? '-', -25, dateFormat);
          _ashar = adjustTime(timings?.asr ?? '-', -26, dateFormat);
          _maghrib = adjustTime(timings?.maghrib ?? '-', -25, dateFormat);
          _isya = adjustTime(timings?.isha ?? '-', -13, dateFormat);
        } else if (_currentProvince == 'Gorontalo') {
          _subuh = adjustTime(timings?.fajr ?? '-', -31, dateFormat);
          _dzuhur = adjustTime(timings?.dhuhr ?? '-', -10, dateFormat);
          _ashar = adjustTime(timings?.asr ?? '-', -11, dateFormat);
          _maghrib = adjustTime(timings?.maghrib ?? '-', -11, dateFormat);
          _isya = adjustTime(timings?.isha ?? '-', 2, dateFormat);
        } else if (_currentProvince == 'North Maluku' ||
            _currentProvince == 'Maluku Utara') {
          _subuh = adjustTime(timings?.fajr ?? '-', 14, dateFormat);
          _dzuhur = adjustTime(timings?.dhuhr ?? '-', 35, dateFormat);
          _ashar = adjustTime(timings?.asr ?? '-', 35, dateFormat);
          _maghrib = adjustTime(timings?.maghrib ?? '-', 36, dateFormat);
          _isya = adjustTime(timings?.isha ?? '-', 48, dateFormat);
        } else if (_currentProvince == 'Maluku') {
          _subuh = adjustTime(timings?.fajr ?? '-', -14, dateFormat);
          _dzuhur = adjustTime(timings?.dhuhr ?? '-', 7, dateFormat);
          _ashar = adjustTime(timings?.asr ?? '-', 7, dateFormat);
          _maghrib = adjustTime(timings?.maghrib ?? '-', 7, dateFormat);
          _isya = adjustTime(timings?.isha ?? '-', 19, dateFormat);
        } else if (_currentProvince == 'Papua') {
          _subuh = adjustTime(timings?.fajr ?? '-', -53, dateFormat);
          _dzuhur = adjustTime(timings?.dhuhr ?? '-', -32, dateFormat);
          _ashar = adjustTime(timings?.asr ?? '-', -33, dateFormat);
          _maghrib = adjustTime(timings?.maghrib ?? '-', -32, dateFormat);
          _isya = adjustTime(timings?.isha ?? '-', -20, dateFormat);
        } else if (_currentProvince == 'West Papua' ||
            _currentProvince == 'Papua Barat') {
          _subuh = adjustTime(timings?.fajr ?? '-', -22, dateFormat);
          _dzuhur = adjustTime(timings?.dhuhr ?? '-', -1, dateFormat);
          _ashar = adjustTime(timings?.asr ?? '-', -1, dateFormat);
          _maghrib = adjustTime(timings?.maghrib ?? '-', -1, dateFormat);
          _isya = adjustTime(timings?.isha ?? '-', 12, dateFormat);
        } else {
          _subuh = timings?.fajr;
          _dzuhur = timings?.dhuhr;
          _ashar = timings?.asr;
          _maghrib = timings?.maghrib;
          _isya = timings?.isha;
        }
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
