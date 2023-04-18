import 'package:desafio_marvel/app/modules/character_detail/domain/entities/comic_data.dart';
import 'package:desafio_marvel/app/modules/character_detail/domain/entities/comic_detail_list.dart';
import 'package:desafio_marvel/app/modules/character_detail/infrastructure/models/comic_detail_list_model.dart';

class ComicDataModel extends ComicData {
  const ComicDataModel({
    required int offset,
    required int limit,
    required int total,
    required int count,
    required ComicDetailList results,
  }) : super(
          total: total,
          offset: offset,
          limit: limit,
          count: count,
          results: results,
        );

  factory ComicDataModel.fromJson(Map<String, dynamic> json) => ComicDataModel(
      offset: json['offset'],
      limit: json['limit'],
      total: json['total'],
      count: json['count'],
      results: ComicDetailListModel.fromJson(json['results']));
}
