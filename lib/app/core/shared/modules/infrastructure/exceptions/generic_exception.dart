import 'package:desafio_marvel/app/core/shared/modules/infrastructure/exceptions/general_exceptions.dart';

class GenericException implements GeneralExceptions {
  @override
  final String message;

  const GenericException(this.message);
}
