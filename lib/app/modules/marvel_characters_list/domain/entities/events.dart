import 'package:desafio_marvel/app/modules/marvel_characters_list/domain/entities/event_item_list.dart';

class Events {
  final int available;
  final String collectionURI;
  final EventItemList itemList;
  final int returned;

  const Events(
      {required this.available,
      required this.collectionURI,
      required this.itemList,
      required this.returned});
}
