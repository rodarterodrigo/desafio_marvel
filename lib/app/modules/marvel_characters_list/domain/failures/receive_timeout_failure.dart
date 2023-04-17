import 'package:desafio_marvel/app/core/shared/modules/domain/failures/general_failures.dart';

class ReceiveTimeoutFailure implements GeneralFailures {
  @override
  final String message;

  const ReceiveTimeoutFailure(this.message);
}
