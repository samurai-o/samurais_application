import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:samurais_application/app/auth/auth_module.dart';
import 'package:samurais_application/app/home/home_module.dart';
import 'package:samurais_application/app/initial_page.dart';
import 'package:samurais_application/authentication/auth_guard.dart';
import 'package:samurais_application/authentication/authentication.dart';
import 'package:user_repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory((i) => AuthenticationRepository()),
        Bind.factory((i) => UserRepository()),
        Bind.factory((i) => AuthenticationState.unknown()),
        Bind.lazySingleton<AuthenticationBloc>((i) => AuthenticationBloc(
            authenticationRepository: i(), userRepository: i(), authenticationState: i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => InitialPage()),
        ModuleRoute('/home', module: HomeModule(), guards: [AuthGuard()]),
        ModuleRoute('/auth',
            module: AuthModule(), transition: TransitionType.fadeIn)
      ];
}

class AppWidget extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<AppWidget> {
  AuthenticationRepository authenticationRepository =
      Modular.get<AuthenticationRepository>();
  AuthenticationBloc authenticationBloc = Modular.get<AuthenticationBloc>();

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: authenticationRepository,
      child: BlocProvider(
        create: (_) => authenticationBloc,
        child: MaterialApp(
          title: 'My Smart App',
          theme: ThemeData(primarySwatch: Colors.blue),
          initialRoute: '/',
          home: Text("测试"),
        ).modular(),
      ),
    );
  }
}
