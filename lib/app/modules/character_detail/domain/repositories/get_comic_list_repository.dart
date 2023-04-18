import 'package:dartz/dartz.dart';
import 'package:desafio_marvel/app/core/shared/modules/domain/failures/general_failures.dart';
import 'package:desafio_marvel/app/modules/character_detail/domain/entities/comic_detail_list.dart';

abstract class GetComicListRepository {
  Future<Either<GeneralFailures, ComicDetailList>> getComicList(
      final String url);
}
