import 'package:dartz/dartz.dart';
import 'package:desafio_marvel/app/core/shared/modules/domain/failures/general_failures.dart';
import 'package:desafio_marvel/app/modules/marvel_characters_list/domain/entities/request_success.dart';

abstract class GetCharacterListRepository {
  Future<Either<GeneralFailures, RequestSuccess>> getCharacterList(
      int offset, int limit);
}
