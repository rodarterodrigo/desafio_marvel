import 'package:desafio_marvel/app/modules/marvel_characters_list/domain/entities/story_item.dart';
import 'package:desafio_marvel/app/modules/marvel_characters_list/domain/entities/story_item_list.dart';
import 'package:desafio_marvel/app/modules/marvel_characters_list/infrastructure/models/story_item_model.dart';

class StoryItemListModel extends StoryItemList {
  const StoryItemListModel({
    required List<StoryItem> storyItems,
  }) : super(
          storyItems: storyItems,
        );

  factory StoryItemListModel.fromJson(List<dynamic> json) => StoryItemListModel(
      storyItems: json.map((e) => StoryItemModel.fromJson(e)).toList());
}
