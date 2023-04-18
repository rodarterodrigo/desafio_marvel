import 'package:dartz/dartz.dart';
import 'package:desafio_marvel/app/core/shared/modules/domain/failures/general_failures.dart';
import 'package:desafio_marvel/app/modules/character_detail/domain/entities/comic_data.dart';
import 'package:desafio_marvel/app/modules/character_detail/domain/repositories/get_comic_list_repository.dart';

abstract class GetComicListUsecase {
  Future<Either<GeneralFailures, ComicData>> call(final String url);
}

class GetComicListUsecaseImplementation implements GetComicListUsecase {
  final GetComicListRepository repository;

  const GetComicListUsecaseImplementation(this.repository);

  @override
  Future<Either<GeneralFailures, ComicData>> call(String url) async =>
      await repository.getComicList(url);
}
