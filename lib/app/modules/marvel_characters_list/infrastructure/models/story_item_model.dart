import 'package:desafio_marvel/app/modules/marvel_characters_list/domain/entities/story_item.dart';

class StoryItemModel extends StoryItem {
  const StoryItemModel({
    required String resourceURI,
    required String name,
    required String type,
  }) : super(
          type: type,
          name: name,
          resourceURI: resourceURI,
        );

  factory StoryItemModel.fromJson(Map<String, dynamic> json) => StoryItemModel(
      resourceURI: json['resourceURI'], name: json['name'], type: json['type']);
}
