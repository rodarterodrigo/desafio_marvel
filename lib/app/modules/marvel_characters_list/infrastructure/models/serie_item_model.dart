import 'package:desafio_marvel/app/modules/marvel_characters_list/domain/entities/serie_item.dart';

class SerieItemModel extends SerieItem {
  const SerieItemModel({
    required String resourceURI,
    required String name,
  }) : super(
          resourceURI: resourceURI,
          name: name,
        );

  factory SerieItemModel.fromJson(Map<String, dynamic> json) =>
      SerieItemModel(resourceURI: json['resourceURI'], name: json['name']);
}
