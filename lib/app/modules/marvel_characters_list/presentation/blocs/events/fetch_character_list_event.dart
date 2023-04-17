import 'package:desafio_marvel/app/modules/marvel_characters_list/presentation/blocs/events/marvel_character_list_events.dart';

class FetchCharacterListEvent implements MarvelCharacterListEvents {
  final int offset;
  final int limit;

  const FetchCharacterListEvent(this.offset, this.limit);
}
