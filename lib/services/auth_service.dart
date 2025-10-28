import 'storage_service.dart';

class AuthService {
  final StorageService _s = StorageService();

  Future<bool> register(String u, String p) async {
    await _s.saveUser(u, p);
    return true;
  }

  Future<bool> login(String u, String p) => _s.check(u, p);
}
