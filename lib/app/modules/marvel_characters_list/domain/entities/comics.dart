import 'package:desafio_marvel/app/modules/marvel_characters_list/domain/entities/comic_item_list.dart';

class Comics {
  final int available;
  final String collectionURI;
  final ComicItemList itemList;
  final int returned;

  const Comics(
      {required this.available,
      required this.collectionURI,
      required this.itemList,
      required this.returned});
}
