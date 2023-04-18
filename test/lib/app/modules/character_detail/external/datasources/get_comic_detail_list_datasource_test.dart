import 'package:desafio_marvel/app/core/packages/http_response.dart';
import 'package:desafio_marvel/app/core/packages/request_client.dart';
import 'package:desafio_marvel/app/core/shared/modules/infrastructure/exceptions/forbiden_exception.dart';
import 'package:desafio_marvel/app/core/shared/modules/infrastructure/exceptions/generic_exception.dart';
import 'package:desafio_marvel/app/core/shared/modules/infrastructure/exceptions/receive_timeout_exception.dart';
import 'package:desafio_marvel/app/modules/character_detail/external/datasources/get_comic_detail_list_datasource_implementation.dart';
import 'package:desafio_marvel/app/modules/character_detail/infrastructure/datasources/get_comic_detail_list_datasource.dart';
import 'package:desafio_marvel/app/modules/character_detail/infrastructure/models/comic_data_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../response_mocks/request_success_response.dart';

class RequestClientMock extends Mock implements RequestClient {}

class ComicDataModelFake extends Fake implements ComicDataModel {}

final RequestClient client = RequestClientMock();
final GetComicDetailListDatasource datasource =
    GetComicDetailListDatasourceImplementation(client);

void main() {
  test('Should return a ComicDataModel', () async {
    when(() => client.get(any())).thenAnswer((invocation) async =>
        const HttpResponse(data: requestSuccessResponse, statusCode: 200));
    final result = await datasource.getComicList('', 1, 2);
    expect(result, isA<ComicDataModel>());
  });

  test('Should throws a ForbidenException', () {
    when(() => client.get(any())).thenAnswer((invocation) async =>
        const HttpResponse(data: requestSuccessResponse, statusCode: 403));
    final result = datasource.getComicList('', 1, 2);
    expect(result, throwsA(isA<ForbidenException>()));
  });

  test('Should throws a GenericException', () {
    when(() => client.get(any())).thenAnswer((invocation) async =>
        const HttpResponse(data: requestSuccessResponse, statusCode: 400));
    final result = datasource.getComicList('', 1, 2);
    expect(result, throwsA(isA<GenericException>()));
  });

  test('Should throws a ReceiveTimeoutException', () {
    when(() => client.get(any()))
        .thenThrow(const ReceiveTimeoutException('ReceiveTimeoutException'));
    final result = datasource.getComicList('', 1, 2);
    expect(result, throwsA(isA<ReceiveTimeoutException>()));
  });
}
