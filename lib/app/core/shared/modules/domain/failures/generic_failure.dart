import 'package:desafio_marvel/app/core/shared/modules/domain/failures/general_failures.dart';

class GenericFailure implements GeneralFailures {
  @override
  final String message;

  const GenericFailure(this.message);
}
