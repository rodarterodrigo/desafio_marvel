import 'package:desafio_marvel/app/core/packages/http_response.dart';
import 'package:desafio_marvel/app/core/packages/request_client.dart';
import 'package:desafio_marvel/app/core/shared/modules/infrastructure/exceptions/forbiden_exception.dart';
import 'package:desafio_marvel/app/core/shared/modules/infrastructure/exceptions/generic_exception.dart';
import 'package:desafio_marvel/app/core/shared/modules/infrastructure/exceptions/invalid_key_exception.dart';
import 'package:desafio_marvel/app/core/shared/modules/infrastructure/exceptions/method_not_allowed_exception.dart';
import 'package:desafio_marvel/app/core/shared/modules/infrastructure/exceptions/missing_parameter_exception.dart';
import 'package:desafio_marvel/app/core/shared/modules/infrastructure/exceptions/receive_timeout_exception.dart';
import 'package:desafio_marvel/app/modules/marvel_characters_list/external/datasources/get_character_list_datasource_implementation.dart';
import 'package:desafio_marvel/app/modules/marvel_characters_list/infrastructure/datasources/get_character_list_datasource.dart';
import 'package:desafio_marvel/app/modules/marvel_characters_list/infrastructure/models/request_success_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../response_mocks/request_failure_response.dart';
import '../response_mocks/request_success_response.dart';

class RequestClientMock extends Mock implements RequestClient {}

final RequestClient client = RequestClientMock();
final GetCharacterListDatasource datasource =
    GetCharacterListDatasourceImplementation(client);

void main() {
  test('Should return a RequestSuccessModel', () async {
    when(() => client.get(any())).thenAnswer((invocation) async =>
        const HttpResponse(data: requestSuccessResponse, statusCode: 200));
    final result = await datasource.getCharacterList(1, 2);
    expect(result, isA<RequestSuccessModel>());
  });

  test('Should throws a MissingParameterException', () async {
    when(() => client.get(any())).thenAnswer((invocation) async =>
        const HttpResponse(data: requestFailureResponse, statusCode: 409));
    final result = datasource.getCharacterList(1, 2);
    expect(result, throwsA(isA<MissingParameterException>()));
  });

  test('Should throws a InvalidKeyException', () async {
    when(() => client.get(any())).thenAnswer((invocation) async =>
        const HttpResponse(data: requestFailureResponse, statusCode: 401));
    final result = datasource.getCharacterList(1, 2);
    expect(result, throwsA(isA<InvalidKeyException>()));
  });

  test('Should throws a MethodNotAllowedException', () async {
    when(() => client.get(any())).thenAnswer((invocation) async =>
        const HttpResponse(data: requestFailureResponse, statusCode: 405));
    final result = datasource.getCharacterList(1, 2);
    expect(result, throwsA(isA<MethodNotAllowedException>()));
  });

  test('Should throws a ForbidenException', () async {
    when(() => client.get(any())).thenAnswer((invocation) async =>
        const HttpResponse(data: requestFailureResponse, statusCode: 403));
    final result = datasource.getCharacterList(1, 2);
    expect(result, throwsA(isA<ForbidenException>()));
  });

  test('Should throws a GenericException', () async {
    when(() => client.get(any())).thenAnswer((invocation) async =>
        const HttpResponse(data: requestFailureResponse, statusCode: 500));
    final result = datasource.getCharacterList(1, 2);
    expect(result, throwsA(isA<GenericException>()));
  });

  test('Should throws a ReceiveTimeoutException', () async {
    when(() => client.get(any()))
        .thenThrow(const ReceiveTimeoutException('ReceiveTimeoutException'));
    final result = datasource.getCharacterList(1, 2);
    expect(result, throwsA(isA<ReceiveTimeoutException>()));
  });
}
