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
import 'package:desafio_marvel/app/modules/character_detail/domain/entities/comic_data.dart';
import 'package:desafio_marvel/app/modules/character_detail/domain/entities/comic_detail_list.dart';
import 'package:desafio_marvel/app/modules/character_detail/domain/usecases/get_comic_list_usecase.dart';
import 'package:desafio_marvel/app/modules/character_detail/presentation/blocs/events/fetch_comic_list_event.dart';
import 'package:desafio_marvel/app/modules/character_detail/presentation/blocs/events/get_comic_list_event.dart';
import 'package:desafio_marvel/app/modules/character_detail/presentation/blocs/get_comic_list_bloc.dart';
import 'package:desafio_marvel/app/modules/marvel_characters_list/domain/entities/request_success.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class GetComicListUsecaseMock extends Mock implements GetComicListUsecase {}

class RequestSuccessFake extends Fake implements RequestSuccess {}

final GetComicListUsecase usecase = GetComicListUsecaseMock();
final GetComicListBloc bloc = GetComicListBloc(usecase);

const ComicData data = ComicData(
    offset: 1,
    limit: 1,
    total: 1,
    count: 1,
    results: ComicDetailList(list: []));

void main() {
  //Get character list states
  test(
      'Should return all states in order and GetRequestSuccessState as final state',
      () {
    when(() => usecase(any()))
        .thenAnswer((invocation) async => const Right(data));
    bloc.add(const GetComicListEvent(''));
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
    when(() => usecase(any())).thenAnswer(
        (invocation) async => const Left(ForbidenFailure('ForbidenFailure')));
    bloc.add(const GetComicListEvent(''));
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
    when(() => usecase(any())).thenAnswer((invocation) async =>
        const Left(ReceiveTimeoutFailure('ReceiveTimeoutFailure')));
    bloc.add(const GetComicListEvent(''));
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
    when(() => usecase(any())).thenAnswer(
        (invocation) async => const Left(GenericFailure('GenericFailure')));
    bloc.add(const GetComicListEvent(''));
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
    when(() => usecase(any()))
        .thenAnswer((invocation) async => const Right(data));
    bloc.add(const FetchComicListEvent(''));
    expect(
        bloc.stream,
        emitsInOrder([
          isA<FetchRequestLoadingState>(),
          isA<FetchRequestSuccessState>(),
        ]));
  });

  test(
      'Should return all states in order and ForbidenFailureState as final state',
      () {
    when(() => usecase(any())).thenAnswer(
        (invocation) async => const Left(ForbidenFailure('ForbidenFailure')));
    bloc.add(const FetchComicListEvent(''));
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
    when(() => usecase(any())).thenAnswer((invocation) async =>
        const Left(ReceiveTimeoutFailure('ReceiveTimeoutFailure')));
    bloc.add(const FetchComicListEvent(''));
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
    when(() => usecase(any())).thenAnswer(
        (invocation) async => const Left(GenericFailure('GenericFailure')));
    bloc.add(const FetchComicListEvent(''));
    expect(
        bloc.stream,
        emitsInOrder([
          isA<FetchRequestLoadingState>(),
          isA<GenericFailureState>(),
        ]));
  });
}
