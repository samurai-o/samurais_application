import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:samurais_application/authentication/authentication.dart';

class InitialPage extends StatelessWidget {


  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
          switch (state.status) {
            case AuthenticationStatus.authenticated:
              Modular.to.pushNamedAndRemoveUntil('/home', (route) => false);
              break;
            case AuthenticationStatus.unauthenticated:
              Modular.to.pushNamedAndRemoveUntil('/auth/login', (route) => false);
              break;
            default:
              break;
          }
        },
        child: Scaffold(
          body: Center(child: Text('loading'),),
        ),
    );
  }
}