import 'package:desafio_marvel/app/core/shared/modules/domain/failures/receive_timeout_failure.dart';
import 'package:desafio_marvel/app/core/shared/modules/presentation/blocs/states/failure_states.dart';

class ReceiveTimeoutFailureState implements FailureStates {
  @override
  final ReceiveTimeoutFailure failure;

  const ReceiveTimeoutFailureState(this.failure);
}
