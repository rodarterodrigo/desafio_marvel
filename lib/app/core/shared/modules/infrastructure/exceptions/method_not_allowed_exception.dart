import 'package:desafio_marvel/app/core/shared/modules/infrastructure/exceptions/general_exceptions.dart';

class MethodNotAllowedException implements GeneralExceptions {
  @override
  final String message;

  const MethodNotAllowedException(this.message);
}
