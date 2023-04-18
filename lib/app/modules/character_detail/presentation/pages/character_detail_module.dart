import 'package:desafio_marvel/app/core/routes/routes.dart';
import 'package:desafio_marvel/app/modules/character_detail/domain/usecases/get_comic_list_usecase.dart';
import 'package:desafio_marvel/app/modules/character_detail/external/datasources/get_comic_detail_list_datasource_implementation.dart';
import 'package:desafio_marvel/app/modules/character_detail/infrastructure/repositories/get_comic_list_repository_implementation.dart';
import 'package:desafio_marvel/app/modules/character_detail/presentation/blocs/get_comic_list_bloc.dart';
import 'package:desafio_marvel/app/modules/character_detail/presentation/pages/character_deatil_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CharacterDetailModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => GetComicDetailListDatasourceImplementation(i())),
    Bind((i) => GetComicListRepositoryImplementation(i())),
    Bind((i) => GetComicListUsecaseImplementation(i())),
    Bind<GetComicListBloc>((i) => GetComicListBloc(i()),
        onDispose: (bloc) => bloc.close()),
  ];

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
