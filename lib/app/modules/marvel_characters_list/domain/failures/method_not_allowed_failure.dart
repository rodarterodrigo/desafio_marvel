import 'package:desafio_marvel/app/modules/marvel_characters_list/domain/failures/character_list_failures.dart';

class MethodNotAllowedFailure implements CharacterListFailures {
  @override
  final String message;

  const MethodNotAllowedFailure(this.message);
}
