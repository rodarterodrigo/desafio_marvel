import 'package:dartz/dartz.dart';
import 'package:desafio_marvel/app/core/shared/modules/domain/failures/forbiden_failure.dart';
import 'package:desafio_marvel/app/core/shared/modules/domain/failures/generic_failure.dart';
import 'package:desafio_marvel/app/core/shared/modules/domain/failures/receive_timeout_failure.dart';
import 'package:desafio_marvel/app/modules/character_detail/domain/entities/comic_detail_list.dart';
import 'package:desafio_marvel/app/modules/character_detail/domain/repositories/get_comic_list_repository.dart';
import 'package:desafio_marvel/app/modules/character_detail/domain/usecases/get_comic_list_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class GetComicListRepositoryMock extends Mock
    implements GetComicListRepository {}

class ComicDetailListFake extends Fake implements ComicDetailList {}

final GetComicListRepository repository = GetComicListRepositoryMock();
final GetComicListUsecase usecase =
    GetComicListUsecaseImplementation(repository);

void main() {
  test('Should return a ComicDetailList entity', () async {
    when(() => repository.getComicList(any()))
        .thenAnswer((invocation) async => Right(ComicDetailListFake()));
    final result = await usecase('');
    expect(result.fold(id, id), isA<ComicDetailList>());
  });

  test('Should return a ForbidenFailure entity', () async {
    when(() => repository.getComicList(any())).thenAnswer(
        (invocation) async => const Left(ForbidenFailure('ForbidenFailure')));
    final result = await usecase('');
    expect(result.fold(id, id), isA<ForbidenFailure>());
  });

  test('Should return a GenericFailure entity', () async {
    when(() => repository.getComicList(any())).thenAnswer(
        (invocation) async => const Left(GenericFailure('GenericFailure')));
    final result = await usecase('');
    expect(result.fold(id, id), isA<GenericFailure>());
  });

  test('Should return a ReceiveTimeoutFailure entity', () async {
    when(() => repository.getComicList(any())).thenAnswer((invocation) async =>
        const Left(ReceiveTimeoutFailure('ReceiveTimeoutFailure')));
    final result = await usecase('');
    expect(result.fold(id, id), isA<ReceiveTimeoutFailure>());
  });
}
