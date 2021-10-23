import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:samurais_application/authentication/authentication.dart';

class MainModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModuleRoute> get routes => [

  ];
}

class MainWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: AuthenticationRepository(),
      child: MaterialApp(
        initialRoute: '/',
        builder: (context, child) {
          return BlocListener<AuthenticationBloc, AuthenticationState>(
              listener: (context, state) {
                switch (state.status) {
                  case AuthenticationStatus.authenticated:
                    Modular.to.pushNamedAndRemoveUntil('/app', (route) => false);
                    break;
                  case AuthenticationStatus.unauthenticated:
                    Modular.to.pushNamedAndRemoveUntil('/user/login', (route) => false);
                    break;
                  default:
                    break;
                }
              },
              child: child,
          );
        },
      ),
    );
  }
}

void main() {
  runApp(ModularApp(module: MainModule(), child: MainWidget(),));
}

// void main() {
//   runApp(App(
//     authenticationRepository: AuthenticationRepository(),
//     userRepository: UserRepository(),
//   ));
// }
