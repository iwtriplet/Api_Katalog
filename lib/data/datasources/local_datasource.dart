import 'package:shared_preferences/shared_preferences.dart';

class LocalDataSource {
  Future<void> saveToken(String token) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setString('token', token);
  }

  Future<String> getToken() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString('token') ?? '';
  }

  Future<void> removeToken() async {
    final pref = await SharedPreferences.getInstance();
    pref.remove('token');
  }
}
