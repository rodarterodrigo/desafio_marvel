import 'package:desafio_marvel/app/core/shared/modules/infrastructure/exceptions/general_exceptions.dart';

class MissingParameterException implements GeneralExceptions {
  @override
  final String message;

  const MissingParameterException(this.message);
}
