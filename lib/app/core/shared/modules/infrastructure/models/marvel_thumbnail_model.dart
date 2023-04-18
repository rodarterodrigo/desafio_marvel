import 'package:desafio_marvel/app/core/shared/modules/domain/entities/marvel_thumbnail.dart';

class MarvelThumbnailModel extends MarvelThumbnnail {
  const MarvelThumbnailModel({
    required String path,
    required String extension,
  }) : super(
          extension: extension,
          path: path,
        );

  factory MarvelThumbnailModel.fromJson(Map<String, dynamic> json) =>
      MarvelThumbnailModel(path: json['path'], extension: json['extension']);
}
