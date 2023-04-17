import 'package:desafio_marvel/app/core/packages/http_response.dart';
import 'package:desafio_marvel/app/core/shared/modules/infrastructure/exceptions/generic_exception.dart';
import 'package:desafio_marvel/app/core/shared/modules/infrastructure/exceptions/receive_timeout_exception.dart';
import 'package:dio/dio.dart';

abstract class RequestClient {
  Future<HttpResponse> get(String url);
  Exception validateClientExceptions(Exception exception);
}

class RequestClientImplementation implements RequestClient {
  final Dio dio;
  final Options _options = Options(
    validateStatus: (status) => true,
    receiveTimeout: const Duration(seconds: 8),
  );

  RequestClientImplementation(this.dio);

  @override
  Future<HttpResponse> get(String url) async {
    try {
      final response = await dio.get(url, options: _options);
      return HttpResponse(
          data: response.data, statusCode: response.statusCode!);
    } on Exception catch (e) {
      throw validateClientExceptions(e);
    }
  }

  @override
  Exception validateClientExceptions(Exception exception) {
    if ((exception is DioError) &&
        exception.type == DioErrorType.receiveTimeout) {
      throw const ReceiveTimeoutException(
          'Não foi possível carregar a página.');
    }
    throw GenericException(exception.toString());
  }
}
