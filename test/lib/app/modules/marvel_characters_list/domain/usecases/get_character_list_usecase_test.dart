import 'package:dartz/dartz.dart';
import 'package:desafio_marvel/app/core/shared/modules/domain/failures/forbiden_failure.dart';
import 'package:desafio_marvel/app/core/shared/modules/domain/failures/generic_failure.dart';
import 'package:desafio_marvel/app/core/shared/modules/domain/failures/invalid_key_failure.dart';
import 'package:desafio_marvel/app/core/shared/modules/domain/failures/method_not_allowed_failure.dart';
import 'package:desafio_marvel/app/core/shared/modules/domain/failures/missing_parameter_failure.dart';
import 'package:desafio_marvel/app/core/shared/modules/domain/failures/receive_timeout_failure.dart';
import 'package:desafio_marvel/app/modules/marvel_characters_list/domain/entities/request_success.dart';
import 'package:desafio_marvel/app/modules/marvel_characters_list/domain/repositories/get_character_list_repository.dart';
import 'package:desafio_marvel/app/modules/marvel_characters_list/domain/usecases/get_character_list_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class GetCharacterListRepositoryMock extends Mock
    implements GetCharacterListRepository {}

class RequestSuccessFake extends Fake implements RequestSuccess {}

final GetCharacterListRepository repository = GetCharacterListRepositoryMock();
final GetCharacterListUsecase usecase =
    GetCharacterListUsecaseImplementation(repository);

void main() {
  test('Should return a RequestSuccess entity', () async {
    when(() => repository.getCharacterList(any(), any()))
        .thenAnswer((invocation) async => Right(RequestSuccessFake()));
    final result = await usecase(1, 2);
    expect(result.fold(id, id), isA<RequestSuccess>());
  });

  test('Should return a ForbidenFailure', () async {
    when(() => repository.getCharacterList(any(), any())).thenAnswer(
        (invocation) async => const Left(ForbidenFailure('ForbidenFailure')));
    final result = await usecase(1, 2);
    expect(result.fold(id, id), isA<ForbidenFailure>());
  });

  test('Should return a InvalidKeyFailure', () async {
    when(() => repository.getCharacterList(any(), any())).thenAnswer(
        (invocation) async =>
            const Left(InvalidKeyFailure('InvalidKeyFailure')));
    final result = await usecase(1, 2);
    expect(result.fold(id, id), isA<InvalidKeyFailure>());
  });

  test('Should return a MethodNotAllowedFailure', () async {
    when(() => repository.getCharacterList(any(), any())).thenAnswer(
        (invocation) async =>
            const Left(MethodNotAllowedFailure('MethodNotAllowedFailure')));
    final result = await usecase(1, 2);
    expect(result.fold(id, id), isA<MethodNotAllowedFailure>());
  });

  test('Should return a MissingParameterFailure', () async {
    when(() => repository.getCharacterList(any(), any())).thenAnswer(
        (invocation) async =>
            const Left(MissingParameterFailure('MissingParameterFailure')));
    final result = await usecase(1, 2);
    expect(result.fold(id, id), isA<MissingParameterFailure>());
  });

  test('Should return a ReceiveTimeoutFailure', () async {
    when(() => repository.getCharacterList(any(), any())).thenAnswer(
        (invocation) async =>
            const Left(ReceiveTimeoutFailure('ReceiveTimeoutFailure')));
    final result = await usecase(1, 2);
    expect(result.fold(id, id), isA<ReceiveTimeoutFailure>());
  });

  test('Should return a GenericFailure', () async {
    when(() => repository.getCharacterList(any(), any())).thenAnswer(
        (invocation) async => const Left(GenericFailure('GenericFailure')));
    final result = await usecase(1, 2);
    expect(result.fold(id, id), isA<GenericFailure>());
  });
}
