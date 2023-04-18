import 'package:desafio_marvel/app/core/shared/modules/domain/failures/general_failures.dart';

class MethodNotAllowedFailure implements GeneralFailures {
  @override
  final String message;

  const MethodNotAllowedFailure(this.message);
}
