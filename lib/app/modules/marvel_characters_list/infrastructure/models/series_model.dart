import 'package:desafio_marvel/app/modules/marvel_characters_list/domain/entities/serie_item_list.dart';
import 'package:desafio_marvel/app/modules/marvel_characters_list/domain/entities/series.dart';
import 'package:desafio_marvel/app/modules/marvel_characters_list/infrastructure/models/serie_item_list_model.dart';

class SeriesModel extends Series {
  const SeriesModel(
      {required int available,
      required String collectionURI,
      required SerieItemList itemList,
      required int returned})
      : super(
          returned: returned,
          collectionURI: collectionURI,
          available: available,
          itemList: itemList,
        );

  factory SeriesModel.fromJson(Map<String, dynamic> json) => SeriesModel(
      available: json['available'],
      collectionURI: json['collectionURI'],
      itemList: SerieItemListModel.fromJson(json['items']),
      returned: json['returned']);
}
