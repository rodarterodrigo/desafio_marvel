import 'package:desafio_marvel/app/core/shared/modules/domain/failures/general_failures.dart';
import 'package:desafio_marvel/app/core/shared/modules/presentation/blocs/states/global_states.dart';

abstract class FailureStates implements GlobalStates {
  final GeneralFailures failure;

  const FailureStates(this.failure);
}
