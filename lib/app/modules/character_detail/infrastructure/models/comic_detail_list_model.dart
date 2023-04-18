import 'package:desafio_marvel/app/modules/character_detail/domain/entities/comic_detail_entity.dart';
import 'package:desafio_marvel/app/modules/character_detail/domain/entities/comic_detail_list.dart';
import 'package:desafio_marvel/app/modules/character_detail/infrastructure/models/comic_detail_model.dart';

class ComicDetailListModel extends ComicDetailList {
  const ComicDetailListModel({
    required List<ComicDetailEntity> list,
  }) : super(list: list);

  factory ComicDetailListModel.fromJson(List<dynamic> json) =>
      ComicDetailListModel(
          list: json.map((e) => ComicDetailModel.fromJson(e)).toList());
}
