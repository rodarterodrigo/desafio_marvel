import 'package:desafio_marvel/app/core/shared/modules/domain/failures/generic_failure.dart';
import 'package:desafio_marvel/app/core/shared/modules/presentation/blocs/states/failure_states.dart';

class GenericFailureState implements FailureStates {
  @override
  final GenericFailure failure;

  const GenericFailureState(this.failure);
}
