import 'package:dartz/dartz.dart';
import 'package:desafio_marvel/app/core/shared/modules/domain/failures/forbiden_failure.dart';
import 'package:desafio_marvel/app/core/shared/modules/domain/failures/generic_failure.dart';
import 'package:desafio_marvel/app/core/shared/modules/domain/failures/receive_timeout_failure.dart';
import 'package:desafio_marvel/app/core/shared/modules/presentation/blocs/states/fetch_request_loading_state.dart';
import 'package:desafio_marvel/app/core/shared/modules/presentation/blocs/states/fetch_request_success_state.dart';
import 'package:desafio_marvel/app/core/shared/modules/presentation/blocs/states/forbiden_failure_state.dart';
import 'package:desafio_marvel/app/core/shared/modules/presentation/blocs/states/generic_failure_state.dart';
import 'package:desafio_marvel/app/core/shared/modules/presentation/blocs/states/get_request_success_state.dart';
import 'package:desafio_marvel/app/core/shared/modules/presentation/blocs/states/loading_state.dart';
import 'package:desafio_marvel/app/core/shared/modules/presentation/blocs/states/receive_timeout_failure_state.dart';
import 'package:desafio_marvel/app/modules/marvel_characters_list/domain/entities/character_list.dart';
import 'package:desafio_marvel/app/modules/marvel_characters_list/domain/entities/data.dart';
import 'package:desafio_marvel/app/modules/marvel_characters_list/domain/entities/request_success.dart';
import 'package:desafio_marvel/app/modules/marvel_characters_list/domain/failures/invalid_key_failure.dart';
import 'package:desafio_marvel/app/modules/marvel_characters_list/domain/failures/method_not_allowed_failure.dart';
import 'package:desafio_marvel/app/modules/marvel_characters_list/domain/failures/missing_parameter_failure.dart';
import 'package:desafio_marvel/app/modules/marvel_characters_list/domain/usecases/get_character_list_usecase.dart';
import 'package:desafio_marvel/app/modules/marvel_characters_list/presentation/blocs/events/fetch_character_list_event.dart';
import 'package:desafio_marvel/app/modules/marvel_characters_list/presentation/blocs/events/get_character_list_event.dart';
import 'package:desafio_marvel/app/modules/marvel_characters_list/presentation/blocs/get_character_list_bloc.dart';
import 'package:desafio_marvel/app/modules/marvel_characters_list/presentation/blocs/states/invalid_key_failure_state.dart';
import 'package:desafio_marvel/app/modules/marvel_characters_list/presentation/blocs/states/method_not_allowed_failure_state.dart';
import 'package:desafio_marvel/app/modules/marvel_characters_list/presentation/blocs/states/missing_parameter_failure_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class GetCharacterListUsecaseMock extends Mock
    implements GetCharacterListUsecase {}

class RequestSuccessFake extends Fake implements RequestSuccess {}

final GetCharacterListUsecase usecase = GetCharacterListUsecaseMock();
final GetCharacterListBloc bloc = GetCharacterListBloc(usecase);

const Data data = Data(
    offset: 1,
    limit: 1,
    total: 1,
    count: 1,
    characterList: CharacterList(list: []));
const RequestSuccess requestSuccess = RequestSuccess(
  data: data,
  etag: '',
  copyright: '',
  code: 1,
  attributionText: '',
  attributionHTML: '',
  status: '',
);

void main() {
  //Get character list states
  test(
      'Should return all states in order and GetRequestSuccessState as final state',
      () {
    when(() => usecase(any(), any()))
        .thenAnswer((invocation) async => const Right(requestSuccess));
    bloc.add(const GetCharacterListEvent(1, 2));
    expect(
        bloc.stream,
        emitsInOrder([
          isA<LoadingState>(),
          isA<GetRequestSuccessState>(),
        ]));
  });

  test(
      'Should return all states in order and InvalidKeyFailureState as final state',
      () {
    when(() => usecase(any(), any())).thenAnswer((invocation) async =>
        const Left(InvalidKeyFailure('InvalidKeyFailure')));
    bloc.add(const GetCharacterListEvent(1, 2));
    expect(
        bloc.stream,
        emitsInOrder([
          isA<LoadingState>(),
          isA<InvalidKeyFailureState>(),
        ]));
  });

  test(
      'Should return all states in order and MethodNotAllowedFailureState as final state',
      () {
    when(() => usecase(any(), any())).thenAnswer((invocation) async =>
        const Left(MethodNotAllowedFailure('MethodNotAllowedFailure')));
    bloc.add(const GetCharacterListEvent(1, 2));
    expect(
        bloc.stream,
        emitsInOrder([
          isA<LoadingState>(),
          isA<MethodNotAllowedFailureState>(),
        ]));
  });

  test(
      'Should return all states in order and MissingParameterFailureState as final state',
      () {
    when(() => usecase(any(), any())).thenAnswer((invocation) async =>
        const Left(MissingParameterFailure('MissingParameterFailure')));
    bloc.add(const GetCharacterListEvent(1, 2));
    expect(
        bloc.stream,
        emitsInOrder([
          isA<LoadingState>(),
          isA<MissingParameterFailureState>(),
        ]));
  });

  test(
      'Should return all states in order and ForbidenFailureState as final state',
      () {
    when(() => usecase(any(), any())).thenAnswer(
        (invocation) async => const Left(ForbidenFailure('ForbidenFailure')));
    bloc.add(const GetCharacterListEvent(1, 2));
    expect(
        bloc.stream,
        emitsInOrder([
          isA<LoadingState>(),
          isA<ForbidenFailureState>(),
        ]));
  });

  test(
      'Should return all states in order and ReceiveTimeoutFailureState as final state',
      () {
    when(() => usecase(any(), any())).thenAnswer((invocation) async =>
        const Left(ReceiveTimeoutFailure('ReceiveTimeoutFailure')));
    bloc.add(const GetCharacterListEvent(1, 2));
    expect(
        bloc.stream,
        emitsInOrder([
          isA<LoadingState>(),
          isA<ReceiveTimeoutFailureState>(),
        ]));
  });

  test(
      'Should return all states in order and GenericFailureState as final state',
      () {
    when(() => usecase(any(), any())).thenAnswer(
        (invocation) async => const Left(GenericFailure('GenericFailure')));
    bloc.add(const GetCharacterListEvent(1, 2));
    expect(
        bloc.stream,
        emitsInOrder([
          isA<LoadingState>(),
          isA<GenericFailureState>(),
        ]));
  });
  //Fetch character list states
  test(
      'Should return all states in order and FetchRequestSuccessState as final state',
      () {
    when(() => usecase(any(), any()))
        .thenAnswer((invocation) async => const Right(requestSuccess));
    bloc.add(const FetchCharacterListEvent(1, 2));
    expect(
        bloc.stream,
        emitsInOrder([
          isA<FetchRequestLoadingState>(),
          isA<FetchRequestSuccessState>(),
        ]));
  });

  test(
      'Should return all states in order and InvalidKeyFailureState as final state',
      () {
    when(() => usecase(any(), any())).thenAnswer((invocation) async =>
        const Left(InvalidKeyFailure('InvalidKeyFailure')));
    bloc.add(const FetchCharacterListEvent(1, 2));
    expect(
        bloc.stream,
        emitsInOrder([
          isA<FetchRequestLoadingState>(),
          isA<InvalidKeyFailureState>(),
        ]));
  });

  test(
      'Should return all states in order and MethodNotAllowedFailureState as final state',
      () {
    when(() => usecase(any(), any())).thenAnswer((invocation) async =>
        const Left(MethodNotAllowedFailure('MethodNotAllowedFailure')));
    bloc.add(const FetchCharacterListEvent(1, 2));
    expect(
        bloc.stream,
        emitsInOrder([
          isA<FetchRequestLoadingState>(),
          isA<MethodNotAllowedFailureState>(),
        ]));
  });

  test(
      'Should return all states in order and MissingParameterFailureState as final state',
      () {
    when(() => usecase(any(), any())).thenAnswer((invocation) async =>
        const Left(MissingParameterFailure('MissingParameterFailure')));
    bloc.add(const FetchCharacterListEvent(1, 2));
    expect(
        bloc.stream,
        emitsInOrder([
          isA<FetchRequestLoadingState>(),
          isA<MissingParameterFailureState>(),
        ]));
  });

  test(
      'Should return all states in order and ForbidenFailureState as final state',
      () {
    when(() => usecase(any(), any())).thenAnswer(
        (invocation) async => const Left(ForbidenFailure('ForbidenFailure')));
    bloc.add(const FetchCharacterListEvent(1, 2));
    expect(
        bloc.stream,
        emitsInOrder([
          isA<FetchRequestLoadingState>(),
          isA<ForbidenFailureState>(),
        ]));
  });

  test(
      'Should return all states in order and ReceiveTimeoutFailureState as final state',
      () {
    when(() => usecase(any(), any())).thenAnswer((invocation) async =>
        const Left(ReceiveTimeoutFailure('ReceiveTimeoutFailure')));
    bloc.add(const FetchCharacterListEvent(1, 2));
    expect(
        bloc.stream,
        emitsInOrder([
          isA<FetchRequestLoadingState>(),
          isA<ReceiveTimeoutFailureState>(),
        ]));
  });

  test(
      'Should return all states in order and GenericFailureState as final state',
      () {
    when(() => usecase(any(), any())).thenAnswer(
        (invocation) async => const Left(GenericFailure('GenericFailure')));
    bloc.add(const FetchCharacterListEvent(1, 2));
    expect(
        bloc.stream,
        emitsInOrder([
          isA<FetchRequestLoadingState>(),
          isA<GenericFailureState>(),
        ]));
  });
}
