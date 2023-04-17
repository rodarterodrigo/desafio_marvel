import 'package:desafio_marvel/app/core/shared/modules/presentation/blocs/states/failure_states.dart';
import 'package:desafio_marvel/app/modules/marvel_characters_list/domain/failures/missing_parameter_failure.dart';
import 'package:desafio_marvel/app/modules/marvel_characters_list/presentation/blocs/states/marvel_character_list_states.dart';

class MissingParameterFailureState
    implements MarvelCharacterListStates, FailureStates {
  @override
  final MissingParameterFailure failure;

  const MissingParameterFailureState(this.failure);
}
