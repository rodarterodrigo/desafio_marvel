import 'package:desafio_marvel/app/modules/marvel_characters_list/infrastructure/exceptions/character_list_exceptions.dart';

class InvalidKeyException implements CharacterListExceptions {
  @override
  final String message;

  const InvalidKeyException(this.message);
}
