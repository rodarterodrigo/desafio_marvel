import 'package:dartz/dartz.dart';
import 'package:desafio_marvel/app/core/shared/modules/domain/failures/forbiden_failure.dart';
import 'package:desafio_marvel/app/core/shared/modules/domain/failures/general_failures.dart';
import 'package:desafio_marvel/app/core/shared/modules/domain/failures/generic_failure.dart';
import 'package:desafio_marvel/app/core/shared/modules/domain/failures/invalid_key_failure.dart';
import 'package:desafio_marvel/app/core/shared/modules/domain/failures/method_not_allowed_failure.dart';
import 'package:desafio_marvel/app/core/shared/modules/domain/failures/missing_parameter_failure.dart';
import 'package:desafio_marvel/app/core/shared/modules/domain/failures/receive_timeout_failure.dart';
import 'package:desafio_marvel/app/core/shared/modules/infrastructure/exceptions/forbiden_exception.dart';
import 'package:desafio_marvel/app/core/shared/modules/infrastructure/exceptions/generic_exception.dart';
import 'package:desafio_marvel/app/core/shared/modules/infrastructure/exceptions/invalid_key_exception.dart';
import 'package:desafio_marvel/app/core/shared/modules/infrastructure/exceptions/method_not_allowed_exception.dart';
import 'package:desafio_marvel/app/core/shared/modules/infrastructure/exceptions/missing_parameter_exception.dart';
import 'package:desafio_marvel/app/core/shared/modules/infrastructure/exceptions/receive_timeout_exception.dart';
import 'package:desafio_marvel/app/modules/marvel_characters_list/domain/entities/request_success.dart';
import 'package:desafio_marvel/app/modules/marvel_characters_list/domain/repositories/get_character_list_repository.dart';
import 'package:desafio_marvel/app/modules/marvel_characters_list/infrastructure/datasources/get_character_list_datasource.dart';
import 'package:desafio_marvel/app/modules/marvel_characters_list/infrastructure/models/request_success_model.dart';

class GetCharacterListRepositoryImplementation
    implements GetCharacterListRepository {
  final GetCharacterListDatasource datasource;

  const GetCharacterListRepositoryImplementation(this.datasource);

  @override
  Future<Either<GeneralFailures, RequestSuccess>> getCharacterList(
      int offset, int limit) async {
    try {
      return Right(RequestSuccessModel.fromJson(
          await datasource.getCharacterList(offset, limit)));
    } on ForbidenException catch (e) {
      return Left(ForbidenFailure(e.message));
    } on InvalidKeyException catch (e) {
      return Left(InvalidKeyFailure(e.message));
    } on MethodNotAllowedException catch (e) {
      return Left(MethodNotAllowedFailure(e.message));
    } on MissingParameterException catch (e) {
      return Left(MissingParameterFailure(e.message));
    } on ReceiveTimeoutException catch (e) {
      return Left(ReceiveTimeoutFailure(e.message));
    } on GenericException catch (e) {
      return Left(GenericFailure(e.message));
    }
  }
}
