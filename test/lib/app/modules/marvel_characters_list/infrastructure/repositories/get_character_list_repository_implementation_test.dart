import 'package:dartz/dartz.dart';
import 'package:desafio_marvel/app/core/shared/modules/domain/failures/forbiden_failure.dart';
import 'package:desafio_marvel/app/core/shared/modules/domain/failures/generic_failure.dart';
import 'package:desafio_marvel/app/core/shared/modules/domain/failures/receive_timeout_failure.dart';
import 'package:desafio_marvel/app/core/shared/modules/infrastructure/exceptions/generic_exception.dart';
import 'package:desafio_marvel/app/core/shared/modules/infrastructure/exceptions/receive_timeout_exception.dart';
import 'package:desafio_marvel/app/modules/marvel_characters_list/domain/entities/request_success.dart';
import 'package:desafio_marvel/app/modules/marvel_characters_list/domain/failures/invalid_key_failure.dart';
import 'package:desafio_marvel/app/modules/marvel_characters_list/domain/failures/method_not_allowed_failure.dart';
import 'package:desafio_marvel/app/modules/marvel_characters_list/domain/failures/missing_parameter_failure.dart';
import 'package:desafio_marvel/app/modules/marvel_characters_list/domain/repositories/get_character_list_repository.dart';
import 'package:desafio_marvel/app/modules/marvel_characters_list/infrastructure/datasources/get_character_list_datasource.dart';
import 'package:desafio_marvel/app/modules/marvel_characters_list/infrastructure/exceptions/forbiden_exception.dart';
import 'package:desafio_marvel/app/modules/marvel_characters_list/infrastructure/exceptions/invalid_key_exception.dart';
import 'package:desafio_marvel/app/modules/marvel_characters_list/infrastructure/exceptions/method_not_allowed_exception.dart';
import 'package:desafio_marvel/app/modules/marvel_characters_list/infrastructure/exceptions/missing_parameter_exception.dart';
import 'package:desafio_marvel/app/modules/marvel_characters_list/infrastructure/models/request_success_model.dart';
import 'package:desafio_marvel/app/modules/marvel_characters_list/infrastructure/repositories/get_character_list_repository_implementation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class GetCharacterListDatasourceMock extends Mock
    implements GetCharacterListDatasource {}

class RequestSuccessModelFake extends Fake implements RequestSuccessModel {}

final GetCharacterListDatasource datasource = GetCharacterListDatasourceMock();
final GetCharacterListRepository repository =
    GetCharacterListRepositoryImplementation(datasource);

void main() {
  test('Should return a RequestSuccess entity', () async {
    when(() => datasource.getCharacterList(any(), any()))
        .thenAnswer((invocation) async => RequestSuccessModelFake());
    final result = await repository.getCharacterList(1, 2);
    expect(result.fold(id, id), isA<RequestSuccess>());
  });

  test('Should return a ForbidenFailure', () async {
    when(() => datasource.getCharacterList(any(), any()))
        .thenThrow(const ForbidenException('ForbidenException'));
    final result = await repository.getCharacterList(1, 2);
    expect(result.fold(id, id), isA<ForbidenFailure>());
  });

  test('Should return a InvalidKeyFailure', () async {
    when(() => datasource.getCharacterList(any(), any()))
        .thenThrow(const InvalidKeyException('InvalidKeyException'));
    final result = await repository.getCharacterList(1, 2);
    expect(result.fold(id, id), isA<InvalidKeyFailure>());
  });

  test('Should return a MethodNotAllowedFailure', () async {
    when(() => datasource.getCharacterList(any(), any())).thenThrow(
        const MethodNotAllowedException('MethodNotAllowedException'));
    final result = await repository.getCharacterList(1, 2);
    expect(result.fold(id, id), isA<MethodNotAllowedFailure>());
  });

  test('Should return a MissingParameterFailure', () async {
    when(() => datasource.getCharacterList(any(), any())).thenThrow(
        const MissingParameterException('MissingParameterException'));
    final result = await repository.getCharacterList(1, 2);
    expect(result.fold(id, id), isA<MissingParameterFailure>());
  });

  test('Should return a ReceiveTimeoutFailure', () async {
    when(() => datasource.getCharacterList(any(), any()))
        .thenThrow(const ReceiveTimeoutException('ReceiveTimeoutException'));
    final result = await repository.getCharacterList(1, 2);
    expect(result.fold(id, id), isA<ReceiveTimeoutFailure>());
  });

  test('Should return a GenericFailure', () async {
    when(() => datasource.getCharacterList(any(), any()))
        .thenThrow(const GenericException('GenericException'));
    final result = await repository.getCharacterList(1, 2);
    expect(result.fold(id, id), isA<GenericFailure>());
  });
}
