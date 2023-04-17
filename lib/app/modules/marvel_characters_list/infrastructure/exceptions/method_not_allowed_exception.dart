import 'package:desafio_marvel/app/modules/marvel_characters_list/infrastructure/exceptions/character_list_exceptions.dart';

class MethodNotAllowedException implements CharacterListExceptions {
  @override
  final String message;

  const MethodNotAllowedException(this.message);
}
