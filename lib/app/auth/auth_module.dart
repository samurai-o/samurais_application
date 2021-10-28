import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:samurais_application/app/auth/login/login_page.dart';
import 'package:samurais_application/app/auth/register/register_page.dart';

class AuthModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => AuthWidget(), children: [
          ChildRoute(
            '/login',
            child: (context, args) => LoginPage(),
          ),
          ChildRoute('/register', child: (context, args) => RegisterPage())
        ])
      ];
}

class AuthWidget extends StatelessWidget {
  Widget buildTitle() {
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
            child: Text(
              'Hello',
              style: TextStyle(
                fontSize: 80.0,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(16.0, 175.0, 0.0, 0.0),
            child: Text('There',
                style: TextStyle(
                    fontSize: 80.0, fontWeight: FontWeight.bold)),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(220.0, 175.0, 0.0, 0.0),
            child: Text('.',
                style: TextStyle(
                    fontSize: 80.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.green)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          buildTitle(),
          Expanded(
              child:Container(
                padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                child: RouterOutlet(),
              )
          )
        ],
      ),
    );
  }
}
