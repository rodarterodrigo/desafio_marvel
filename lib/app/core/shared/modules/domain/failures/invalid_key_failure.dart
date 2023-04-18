import 'package:desafio_marvel/app/core/shared/modules/domain/failures/general_failures.dart';

class InvalidKeyFailure implements GeneralFailures {
  @override
  final String message;

  const InvalidKeyFailure(this.message);
}
