import 'package:desafio_marvel/app/modules/marvel_characters_list/domain/entities/story_item_list.dart';

class Stories {
  final int available;
  final String collectionURI;
  final StoryItemList storyItemList;
  final int returned;

  const Stories(
      {required this.available,
      required this.collectionURI,
      required this.storyItemList,
      required this.returned});
}
