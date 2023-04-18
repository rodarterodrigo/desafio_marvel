import 'package:desafio_marvel/app/core/shared/modules/domain/failures/invalid_key_failure.dart';
import 'package:desafio_marvel/app/core/shared/modules/presentation/blocs/states/failure_states.dart';
import 'package:desafio_marvel/app/modules/marvel_characters_list/presentation/blocs/states/marvel_character_list_states.dart';

class InvalidKeyFailureState
    implements MarvelCharacterListStates, FailureStates {
  @override
  final InvalidKeyFailure failure;

  const InvalidKeyFailureState(this.failure);
}
