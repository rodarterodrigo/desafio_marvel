import 'package:desafio_marvel/app/modules/marvel_characters_list/domain/entities/comic_item.dart';

class ComicItemModel extends ComicItem {
  const ComicItemModel({
    required String resourceURI,
    required String name,
  }) : super(
          resourceURI: resourceURI,
          name: name,
        );

  factory ComicItemModel.fromJson(Map<String, dynamic> json) =>
      ComicItemModel(resourceURI: json['resourceURI'], name: json['name']);
}
