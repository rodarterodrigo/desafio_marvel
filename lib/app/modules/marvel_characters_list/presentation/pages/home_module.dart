import 'package:desafio_marvel/app/core/routes/routes.dart';
import 'package:desafio_marvel/app/modules/character_detail/presentation/pages/character_detail_module.dart';
import 'package:desafio_marvel/app/modules/marvel_characters_list/domain/usecases/get_character_list_usecase.dart';
import 'package:desafio_marvel/app/modules/marvel_characters_list/external/datasources/get_character_list_datasource_implementation.dart';
import 'package:desafio_marvel/app/modules/marvel_characters_list/infrastructure/repositories/get_character_list_repository_implementation.dart';
import 'package:desafio_marvel/app/modules/marvel_characters_list/presentation/blocs/get_character_list_bloc.dart';
import 'package:desafio_marvel/app/modules/marvel_characters_list/presentation/pages/home_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => GetCharacterListDatasourceImplementation(i())),
    Bind((i) => GetCharacterListRepositoryImplementation(i())),
    Bind((i) => GetCharacterListUsecaseImplementation(i())),
    Bind<GetCharacterListBloc>((i) => GetCharacterListBloc(i()),
        onDispose: (bloc) => bloc.close()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Routes.initial,
        child: (context, arguments) => const HomePage(),
        transition: TransitionType.rightToLeft,
        duration: const Duration(milliseconds: 400)),
    ModuleRoute(Routes.characterDetail, module: CharacterDetailModule()),
  ];
}
