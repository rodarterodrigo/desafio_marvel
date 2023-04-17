import 'package:desafio_marvel/app/modules/app_module.dart';
import 'package:desafio_marvel/app/modules/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() =>
    runApp(ModularApp(module: AppModule(), child: const AppWidget()));
