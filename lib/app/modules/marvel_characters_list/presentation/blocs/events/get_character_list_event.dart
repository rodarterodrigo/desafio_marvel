import 'package:desafio_marvel/app/modules/marvel_characters_list/presentation/blocs/events/marvel_character_list_events.dart';

class GetCharacterListEvent implements MarvelCharacterListEvents {
  final int offset;
  final int limit;

  const GetCharacterListEvent(this.offset, this.limit);
}
