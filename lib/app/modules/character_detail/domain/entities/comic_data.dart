import 'package:desafio_marvel/app/modules/character_detail/domain/entities/comic_detail_list.dart';

class ComicData {
  final int offset;
  final int limit;
  final int total;
  final int count;
  final ComicDetailList results;

  const ComicData(
      {required this.offset,
      required this.limit,
      required this.total,
      required this.count,
      required this.results});
}
