import 'package:desafio_marvel/app/core/shared/modules/infrastructure/exceptions/general_exceptions.dart';

class ForbidenException implements GeneralExceptions {
  @override
  final String message;

  const ForbidenException(this.message);
}
