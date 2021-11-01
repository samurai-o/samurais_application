
import 'package:authentication_repository/authentication_repository.dart';

class UserService {
  final AuthenticationRepository _authenticationRepository;

  UserService({
    required AuthenticationRepository authenticationRepository,
  }): _authenticationRepository = authenticationRepository;

  Future login({ required String username, required String password, }) async {
    return this._authenticationRepository.logIn(username: username, password: password);
  }
}