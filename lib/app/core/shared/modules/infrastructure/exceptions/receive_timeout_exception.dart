import 'package:desafio_marvel/app/core/shared/modules/infrastructure/exceptions/general_exceptions.dart';

class ReceiveTimeoutException implements GeneralExceptions {
  @override
  final String message;

  const ReceiveTimeoutException(this.message);
}
