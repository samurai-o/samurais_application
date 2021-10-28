import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:samurais_application/app/app.module.dart';

void main() {
  runApp(ModularApp(module: AppModule(), child: AppWidget()));
}
