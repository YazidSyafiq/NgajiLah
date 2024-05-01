import 'package:shared_preferences/shared_preferences.dart';

String _keyToken = 'token';
String _keyAddress = 'address';

class SharedPref {
  static void saveToken({required String token}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    await preferences.setString(_keyToken, token);
  }

  static Future<String?> getToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    String? token = preferences.getString(_keyToken);

    return token;
  }

  static void saveAddress({required String address}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    await preferences.setString(_keyAddress, address);
  }

  static Future<String?> getAddress() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    String? address = preferences.getString(_keyAddress);

    return address;
  }
}
