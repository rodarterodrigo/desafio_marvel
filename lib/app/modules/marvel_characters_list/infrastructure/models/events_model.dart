import 'package:desafio_marvel/app/modules/marvel_characters_list/domain/entities/event_item_list.dart';
import 'package:desafio_marvel/app/modules/marvel_characters_list/domain/entities/events.dart';
import 'package:desafio_marvel/app/modules/marvel_characters_list/infrastructure/models/event_item_list.dart';

class EventsModel extends Events {
  const EventsModel({
    required int available,
    required String collectionURI,
    required EventItemList itemList,
    required int returned,
  }) : super(
          itemList: itemList,
          available: available,
          collectionURI: collectionURI,
          returned: returned,
        );

  factory EventsModel.fromJson(Map<String, dynamic> json) => EventsModel(
      available: json['available'],
      collectionURI: json['collectionURI'],
      itemList: EventItemListModel.fromJson(json['items']),
      returned: json['returned']);
}
