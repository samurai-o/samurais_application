
import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:logger/logger.dart';
import 'package:samurais_application/authentication/authentication.dart';

class AuthGuard extends RouteGuard {
  AuthGuard():super(redirectTo: '/auth/login');
  final log = Logger();

  @override
  Future<bool> canActivate(String path, ModularRoute router) async {
    AuthenticationStatus status = Modular.get<AuthenticationState>().status;
    log.i(status);
    return status == AuthenticationStatus.authenticated;
  }
}