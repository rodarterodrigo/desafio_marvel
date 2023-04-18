import 'package:desafio_marvel/app/core/shared/modules/domain/entities/marvel_thumbnail.dart';
import 'package:desafio_marvel/app/core/shared/modules/infrastructure/models/marvel_thumbnail_model.dart';
import 'package:desafio_marvel/app/modules/character_detail/domain/entities/comic_detail_entity.dart';

class ComicDetailModel extends ComicDetailEntity {
  const ComicDetailModel({
    required int id,
    required int digitalId,
    required String title,
    required int issueNumber,
    required String variantDescription,
    required String description,
    required String modified,
    required String isbn,
    required String upc,
    required String diamondCode,
    required String ean,
    required String issn,
    required String format,
    required int pageCount,
    required MarvelThumbnnail thumbnail,
  }) : super(
          thumbnail: thumbnail,
          modified: modified,
          description: description,
          id: id,
          diamondCode: diamondCode,
          digitalId: digitalId,
          ean: ean,
          format: format,
          isbn: isbn,
          issn: issn,
          issueNumber: issueNumber,
          pageCount: pageCount,
          title: title,
          upc: upc,
          variantDescription: variantDescription,
        );

  factory ComicDetailModel.fromJson(Map<String, dynamic> json) =>
      ComicDetailModel(
          id: json['id'],
          digitalId: json['digitalId'],
          title: json['title'],
          issueNumber: json['issueNumber'],
          variantDescription: json['variantDescription'],
          description: json['description'],
          modified: json['modified'],
          isbn: json['isbn'],
          upc: json['upc'],
          diamondCode: json['diamondCode'],
          ean: json['ean'],
          issn: json['issn'],
          format: json['format'],
          pageCount: json['pageCount'],
          thumbnail: MarvelThumbnailModel.fromJson(json['thumbnail']));
}
