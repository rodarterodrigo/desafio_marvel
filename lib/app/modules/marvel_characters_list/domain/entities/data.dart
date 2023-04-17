import 'package:desafio_marvel/app/modules/marvel_characters_list/domain/entities/character_list.dart';

class Data {
  final int offset;
  final int limit;
  final int total;
  final int count;
  final CharacterList characterList;

  const Data(
      {required this.offset,
      required this.limit,
      required this.total,
      required this.count,
      required this.characterList});
}
