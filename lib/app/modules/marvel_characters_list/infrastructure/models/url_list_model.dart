import 'package:desafio_marvel/app/modules/marvel_characters_list/domain/entities/url.dart';
import 'package:desafio_marvel/app/modules/marvel_characters_list/domain/entities/url_list.dart';
import 'package:desafio_marvel/app/modules/marvel_characters_list/infrastructure/models/url_model.dart';

class UrlListModel extends UrlList {
  const UrlListModel({
    required List<Url> urls,
  }) : super(
          urls: urls,
        );

  factory UrlListModel.fromJson(List<dynamic> json) =>
      UrlListModel(urls: json.map((e) => UrlModel.fromJson(e)).toList());
}
