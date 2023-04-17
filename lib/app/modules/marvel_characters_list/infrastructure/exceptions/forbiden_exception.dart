import 'package:desafio_marvel/app/modules/marvel_characters_list/infrastructure/exceptions/character_list_exceptions.dart';

class ForbidenException implements CharacterListExceptions {
  @override
  final String message;

  const ForbidenException(this.message);
}
