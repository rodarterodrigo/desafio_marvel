import 'package:desafio_marvel/app/modules/marvel_characters_list/domain/entities/serie_item.dart';
import 'package:desafio_marvel/app/modules/marvel_characters_list/domain/entities/serie_item_list.dart';
import 'package:desafio_marvel/app/modules/marvel_characters_list/infrastructure/models/serie_item_model.dart';

class SerieItemListModel extends SerieItemList {
  const SerieItemListModel({
    required List<SerieItem> serieItems,
  }) : super(
          serieItems: serieItems,
        );

  factory SerieItemListModel.fromJson(List<dynamic> json) => SerieItemListModel(
      serieItems: json.map((e) => SerieItemModel.fromJson(e)).toList());
}
