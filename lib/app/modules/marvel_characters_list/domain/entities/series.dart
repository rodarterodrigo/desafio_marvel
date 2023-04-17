import 'package:desafio_marvel/app/modules/marvel_characters_list/domain/entities/serie_item_list.dart';

class Series {
  final int available;
  final String collectionURI;
  final SerieItemList itemList;
  final int returned;

  const Series(
      {required this.available,
      required this.collectionURI,
      required this.itemList,
      required this.returned});
}
