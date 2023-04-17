import 'package:desafio_marvel/app/modules/marvel_characters_list/domain/entities/character_list.dart';
import 'package:desafio_marvel/app/modules/marvel_characters_list/domain/entities/data.dart';
import 'package:desafio_marvel/app/modules/marvel_characters_list/infrastructure/models/character_list_model.dart';

class DataModel extends Data {
  const DataModel({
    required int offset,
    required int limit,
    required int total,
    required int count,
    required CharacterList characterList,
  }) : super(
          count: count,
          characterList: characterList,
          limit: limit,
          offset: offset,
          total: total,
        );

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
      offset: json['offset'],
      limit: json['limit'],
      total: json['total'],
      count: json['count'],
      characterList: CharacterListModel.fromJson(json['results']));
}
