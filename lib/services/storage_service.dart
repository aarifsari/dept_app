import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static const _kUser = 'user.username';
  static const _kPass = 'user.password';

  Future<void> saveUser(String u, String p) async {
    final sp = await SharedPreferences.getInstance();
    await sp.setString(_kUser, u);
    await sp.setString(_kPass, p);
  }

  Future<bool> check(String u, String p) async {
    final sp = await SharedPreferences.getInstance();
    return sp.getString(_kUser) == u && sp.getString(_kPass) == p;
  }
}
