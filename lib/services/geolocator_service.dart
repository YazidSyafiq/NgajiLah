import 'package:geolocator/geolocator.dart';

class LocationServiceDisabledException implements Exception {
  String get message => "Layanan lokasi tidak tersedia.";
}

class LocationPermissionDeniedException implements Exception {
  String get message => "Izin lokasi ditolak.";
}

class GeolocatorService {
  Future<Position> getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw LocationServiceDisabledException(); // Lempar pengecualian jika layanan lokasi tidak tersedia
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw LocationPermissionDeniedException(); // Lempar pengecualian jika izin ditolak
      }
    }

    // Jika izin diberikan dan layanan tersedia, kembalikan posisi saat ini
    return await Geolocator.getCurrentPosition();
  }
}
