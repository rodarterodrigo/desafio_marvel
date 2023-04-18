import 'package:desafio_marvel/app/core/shared/modules/domain/entities/marvel_thumbnail.dart';

class ComicDetailEntity {
  final int id;
  final int digitalId;
  final String title;
  final int issueNumber;
  final String variantDescription;
  final String description;
  final String modified;
  final String isbn;
  final String upc;
  final String diamondCode;
  final String ean;
  final String issn;
  final String format;
  final int pageCount;
  final MarvelThumbnnail thumbnail;

  const ComicDetailEntity(
      {required this.id,
      required this.digitalId,
      required this.title,
      required this.issueNumber,
      required this.variantDescription,
      required this.description,
      required this.modified,
      required this.isbn,
      required this.upc,
      required this.diamondCode,
      required this.ean,
      required this.issn,
      required this.format,
      required this.pageCount,
      required this.thumbnail});
}
