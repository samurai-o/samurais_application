abstract class AuthService {
  Future<bool> login({required String account, required String password});

  Future<bool> register({required String account, required String password});
}
