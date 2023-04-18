import 'package:desafio_marvel/app/core/shared/modules/infrastructure/exceptions/general_exceptions.dart';

class InvalidKeyException implements GeneralExceptions {
  @override
  final String message;

  const InvalidKeyException(this.message);
}
