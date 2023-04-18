import 'package:desafio_marvel/app/core/shared/modules/domain/failures/general_failures.dart';

class MissingParameterFailure implements GeneralFailures {
  @override
  final String message;

  const MissingParameterFailure(this.message);
}
