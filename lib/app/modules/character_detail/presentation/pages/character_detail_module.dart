import 'package:desafio_marvel/app/core/routes/routes.dart';
import 'package:desafio_marvel/app/modules/character_detail/presentation/pages/character_deatil_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CharacterDetailModule extends Module {
  @override
  List<Bind> binds = [];

  @override
  List<ModularRoute> routes = [
    ChildRoute(
      Routes.initial,
      child: (context, arguments) =>
          CharacterDetailPage(characterData: arguments.data),
      transition: TransitionType.rightToLeft,
      duration: const Duration(milliseconds: 400),
    ),
  ];
}
