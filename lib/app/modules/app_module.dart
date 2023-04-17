import 'package:desafio_marvel/app/core/packages/request_client.dart';
import 'package:desafio_marvel/app/core/routes/routes.dart';
import 'package:desafio_marvel/app/modules/marvel_characters_list/presentation/pages/home_module.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => Dio()),
    Bind((i) => RequestClientImplementation(i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Routes.initial, module: HomeModule()),
  ];
}
