

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes =>[
    ChildRoute('/', child: (context, args) => HomeWidget())
  ];
}


class HomeWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Page')),
      body: Center(
        child: Text('This is initial page'),
      ),
    );
  }
}