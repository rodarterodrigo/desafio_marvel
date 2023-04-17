import 'package:desafio_marvel/app/modules/marvel_characters_list/domain/entities/comic_item.dart';
import 'package:desafio_marvel/app/modules/marvel_characters_list/domain/entities/comic_item_list.dart';
import 'package:desafio_marvel/app/modules/marvel_characters_list/infrastructure/models/comic_item_model.dart';

class ComicItemListModel extends ComicItemList {
  const ComicItemListModel({
    required List<ComicItem> comicItems,
  }) : super(
          comicItems: comicItems,
        );

  factory ComicItemListModel.fromJson(List<dynamic> json) => ComicItemListModel(
      comicItems: json.map((e) => ComicItemModel.fromJson(e)).toList());
}
