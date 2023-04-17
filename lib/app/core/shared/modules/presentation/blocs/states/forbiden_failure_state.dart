import 'package:desafio_marvel/app/core/shared/modules/domain/failures/forbiden_failure.dart';
import 'package:desafio_marvel/app/core/shared/modules/presentation/blocs/states/failure_states.dart';

class ForbidenFailureState implements FailureStates {
  @override
  final ForbidenFailure failure;

  const ForbidenFailureState(this.failure);
}
