import 'package:dartz/dartz.dart';
import 'package:desafio_marvel/app/core/shared/modules/domain/failures/forbiden_failure.dart';
import 'package:desafio_marvel/app/core/shared/modules/domain/failures/general_failures.dart';
import 'package:desafio_marvel/app/core/shared/modules/domain/failures/generic_failure.dart';
import 'package:desafio_marvel/app/core/shared/modules/domain/failures/receive_timeout_failure.dart';
import 'package:desafio_marvel/app/core/shared/modules/infrastructure/exceptions/generic_exception.dart';
import 'package:desafio_marvel/app/core/shared/modules/infrastructure/exceptions/receive_timeout_exception.dart';
import 'package:desafio_marvel/app/modules/character_detail/domain/entities/comic_data.dart';
import 'package:desafio_marvel/app/modules/character_detail/domain/repositories/get_comic_list_repository.dart';
import 'package:desafio_marvel/app/modules/character_detail/infrastructure/datasources/get_comic_detail_list_datasource.dart';
import 'package:desafio_marvel/app/modules/marvel_characters_list/infrastructure/exceptions/forbiden_exception.dart';

class GetComicListRepositoryImplementation implements GetComicListRepository {
  final GetComicDetailListDatasource datasource;

  GetComicListRepositoryImplementation(this.datasource);

  @override
  Future<Either<GeneralFailures, ComicData>> getComicList(
      String url, int offset, int limit) async {
    try {
      return Right(await datasource.getComicList(url, offset, limit));
    } on ForbidenException catch (e) {
      return Left(ForbidenFailure(e.message));
    } on ReceiveTimeoutException catch (e) {
      return Left(ReceiveTimeoutFailure(e.message));
    } on GenericException catch (e) {
      return Left(GenericFailure(e.message));
    }
  }
}
