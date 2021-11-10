import 'dart:async';
import 'package:authentication_repository/src/service.dart';
import 'package:samapi/samapi.dart';

final api = Samapi();

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class AuthenticationRepository {
  final _controller = StreamController<AuthenticationStatus>();
  // ignore: unused_field
  final AuthService _authService;

  AuthenticationRepository({required AuthService service})
      : _authService = service;

  Stream<AuthenticationStatus> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield AuthenticationStatus.unauthenticated;
    yield* _controller.stream;
  }

  Future<void> logIn({
    required String username,
    required String password,
  }) async {
    var res = await api.post(path: path);
    _controller.add(AuthenticationStatus.authenticated);
  }

  void action(AuthenticationStatus event) {
    _controller.add(event);
  }

  void logOut() {
    _controller.add(AuthenticationStatus.unauthenticated);
  }

  void dispose() => _controller.close();
}
