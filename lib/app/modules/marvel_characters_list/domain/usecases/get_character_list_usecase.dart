import 'package:dartz/dartz.dart';
import 'package:desafio_marvel/app/core/shared/modules/domain/failures/general_failures.dart';
import 'package:desafio_marvel/app/modules/marvel_characters_list/domain/entities/request_success.dart';
import 'package:desafio_marvel/app/modules/marvel_characters_list/domain/repositories/get_character_list_repository.dart';

abstract class GetCharacterListUsecase {
  Future<Either<GeneralFailures, RequestSuccess>> call(int offset, int limit);
}

class GetCharacterListUsecaseImplementation implements GetCharacterListUsecase {
  final GetCharacterListRepository repository;

  const GetCharacterListUsecaseImplementation(this.repository);

  @override
  Future<Either<GeneralFailures, RequestSuccess>> call(
          int offset, int limit) async =>
      await repository.getCharacterList(offset, limit);
}
