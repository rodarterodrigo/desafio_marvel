import 'package:desafio_marvel/app/modules/character_detail/presentation/blocs/events/comic_list_events.dart';

class GetComicListEvent implements ComicListEvents {
  @override
  final String url;

  const GetComicListEvent(this.url);
}
