import 'package:desafio_marvel/app/modules/marvel_characters_list/domain/entities/comic_item_list.dart';
import 'package:desafio_marvel/app/modules/marvel_characters_list/domain/entities/comics.dart';
import 'package:desafio_marvel/app/modules/marvel_characters_list/infrastructure/models/comic_item_list_model.dart';

class ComicsModel extends Comics {
  const ComicsModel({
    required int available,
    required String collectionURI,
    required ComicItemList itemList,
    required int returned,
  }) : super(
          returned: returned,
          collectionURI: collectionURI,
          available: available,
          itemList: itemList,
        );

  factory ComicsModel.fromJson(Map<String, dynamic> json) => ComicsModel(
      available: json['available'],
      collectionURI: json['collectionURI'],
      itemList: ComicItemListModel.fromJson(json['items']),
      returned: json['returned']);
}
