import 'package:desafio_marvel/app/modules/marvel_characters_list/domain/entities/event_item.dart';

class EventItemModel extends EventItem {
  const EventItemModel({
    required String resourceURI,
    required String name,
  }) : super(
          name: name,
          resourceURI: resourceURI,
        );

  factory EventItemModel.fromJson(Map<String, dynamic> json) =>
      EventItemModel(resourceURI: json['resourceURI'], name: json['name']);
}
