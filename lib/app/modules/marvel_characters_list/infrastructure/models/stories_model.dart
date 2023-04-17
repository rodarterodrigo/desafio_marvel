import 'package:desafio_marvel/app/modules/marvel_characters_list/domain/entities/stories.dart';
import 'package:desafio_marvel/app/modules/marvel_characters_list/domain/entities/story_item_list.dart';
import 'package:desafio_marvel/app/modules/marvel_characters_list/infrastructure/models/story_item_list_model.dart';

class StoriesModel extends Stories {
  const StoriesModel({
    required int available,
    required String collectionURI,
    required StoryItemList storyItemList,
    required int returned,
  }) : super(
          available: available,
          collectionURI: collectionURI,
          returned: returned,
          storyItemList: storyItemList,
        );

  factory StoriesModel.fromJson(Map<String, dynamic> json) => StoriesModel(
        available: json['available'],
        collectionURI: json['collectionURI'],
        storyItemList: StoryItemListModel.fromJson(json['items']),
        returned: json['returned'],
      );
}
