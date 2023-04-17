import 'package:desafio_marvel/app/modules/marvel_characters_list/domain/entities/url.dart';

class UrlModel extends Url {
  const UrlModel({
    required String type,
    required String url,
  }) : super(
          type: type,
          url: url,
        );

  factory UrlModel.fromJson(Map<String, dynamic> json) =>
      UrlModel(type: json['type'], url: json['url']);
}
