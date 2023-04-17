import 'package:desafio_marvel/app/modules/marvel_characters_list/domain/entities/character_thumbnail.dart';

class CharacterThumbnailModel extends CharacterThumbnail {
  const CharacterThumbnailModel({
    required String path,
    required String extension,
  }) : super(
          extension: extension,
          path: path,
        );

  factory CharacterThumbnailModel.fromJson(Map<String, dynamic> json) =>
      CharacterThumbnailModel(path: json['path'], extension: json['extension']);
}
