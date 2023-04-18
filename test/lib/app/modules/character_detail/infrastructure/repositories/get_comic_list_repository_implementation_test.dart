import 'package:dartz/dartz.dart';
import 'package:desafio_marvel/app/core/shared/modules/domain/failures/forbiden_failure.dart';
import 'package:desafio_marvel/app/core/shared/modules/domain/failures/generic_failure.dart';
import 'package:desafio_marvel/app/core/shared/modules/domain/failures/receive_timeout_failure.dart';
import 'package:desafio_marvel/app/core/shared/modules/infrastructure/exceptions/forbiden_exception.dart';
import 'package:desafio_marvel/app/core/shared/modules/infrastructure/exceptions/generic_exception.dart';
import 'package:desafio_marvel/app/core/shared/modules/infrastructure/exceptions/receive_timeout_exception.dart';
import 'package:desafio_marvel/app/modules/character_detail/domain/entities/comic_data.dart';
import 'package:desafio_marvel/app/modules/character_detail/domain/repositories/get_comic_list_repository.dart';
import 'package:desafio_marvel/app/modules/character_detail/infrastructure/datasources/get_comic_detail_list_datasource.dart';
import 'package:desafio_marvel/app/modules/character_detail/infrastructure/models/comic_data_model.dart';
import 'package:desafio_marvel/app/modules/character_detail/infrastructure/repositories/get_comic_list_repository_implementation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class GetComicDetailListDatasourceMock extends Mock
    implements GetComicDetailListDatasource {}

class ComicDataModelFake extends Fake implements ComicDataModel {}

final GetComicDetailListDatasource datasource =
    GetComicDetailListDatasourceMock();
final GetComicListRepository repository =
    GetComicListRepositoryImplementation(datasource);

void main() {
  test('Should return a ComicData entity', () async {
    when(() => datasource.getComicList(any(), any(), any()))
        .thenAnswer((invocation) async => ComicDataModelFake());
    final result = await repository.getComicList('', 1, 2);
    expect(result.fold(id, id), isA<ComicData>());
  });

  test('Should throw a ForbidenException an return a ForbidenFailure',
      () async {
    when(() => datasource.getComicList(any(), any(), any()))
        .thenThrow(const ForbidenException('ForbidenException'));
    final result = await repository.getComicList('', 1, 2);
    expect(result.fold(id, id), isA<ForbidenFailure>());
  });

  test(
      'Should throw a ReceiveTimeoutException an return a ReceiveTimeoutFailure',
      () async {
    when(() => datasource.getComicList(any(), any(), any()))
        .thenThrow(const ReceiveTimeoutException('ReceiveTimeoutException'));
    final result = await repository.getComicList('', 1, 2);
    expect(result.fold(id, id), isA<ReceiveTimeoutFailure>());
  });

  test('Should throw a GenericException an return a GenericFailure', () async {
    when(() => datasource.getComicList(any(), any(), any()))
        .thenThrow(const GenericException('GenericException'));
    final result = await repository.getComicList('', 1, 2);
    expect(result.fold(id, id), isA<GenericFailure>());
  });
}
