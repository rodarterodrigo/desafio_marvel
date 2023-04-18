import 'package:desafio_marvel/app/modules/character_detail/presentation/blocs/events/comic_list_events.dart';

class FetchComicListEvent implements ComicListEvents {
  @override
  final String url;
  @override
  final int offset;
  @override
  final int limit;

  const FetchComicListEvent(
      {required this.url, required this.offset, required this.limit});
}
