import 'package:desafio_marvel/app/modules/marvel_characters_list/domain/entities/character_data.dart';
import 'package:desafio_marvel/app/modules/marvel_characters_list/domain/entities/character_list.dart';
import 'package:desafio_marvel/app/modules/marvel_characters_list/infrastructure/models/character_data_model.dart';

class CharacterListModel extends CharacterList {
  const CharacterListModel({
    required List<CharacterData> characterList,
  }) : super(
          list: characterList,
        );

  factory CharacterListModel.fromJson(List<dynamic> json) => CharacterListModel(
      characterList: json.map((e) => CharacterDataModel.fromJson(e)).toList());
}
