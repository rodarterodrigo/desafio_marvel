import 'package:desafio_marvel/app/modules/marvel_characters_list/domain/entities/event_item.dart';
import 'package:desafio_marvel/app/modules/marvel_characters_list/domain/entities/event_item_list.dart';
import 'package:desafio_marvel/app/modules/marvel_characters_list/infrastructure/models/event_item_model.dart';

class EventItemListModel extends EventItemList {
  const EventItemListModel({
    required List<EventItem> eventItems,
  }) : super(
          eventItems: eventItems,
        );

  factory EventItemListModel.fromJson(List<dynamic> json) => EventItemListModel(
      eventItems: json.map((e) => EventItemModel.fromJson(e)).toList());
}
