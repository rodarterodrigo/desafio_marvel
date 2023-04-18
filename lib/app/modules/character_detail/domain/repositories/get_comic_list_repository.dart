import 'package:dartz/dartz.dart';
import 'package:desafio_marvel/app/core/shared/modules/domain/failures/general_failures.dart';
import 'package:desafio_marvel/app/modules/character_detail/domain/entities/comic_data.dart';

abstract class GetComicListRepository {
  Future<Either<GeneralFailures, ComicData>> getComicList(final String url);
}
