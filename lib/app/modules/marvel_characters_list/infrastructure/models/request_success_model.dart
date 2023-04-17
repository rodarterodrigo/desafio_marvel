import 'package:desafio_marvel/app/modules/marvel_characters_list/domain/entities/data.dart';
import 'package:desafio_marvel/app/modules/marvel_characters_list/domain/entities/request_success.dart';
import 'package:desafio_marvel/app/modules/marvel_characters_list/infrastructure/models/data_model.dart';

class RequestSuccessModel extends RequestSuccess {
  const RequestSuccessModel({
    required int code,
    required String status,
    required String copyright,
    required String attributionText,
    required String attributionHTML,
    required String etag,
    required Data data,
  }) : super(
          data: data,
          status: status,
          attributionHTML: attributionHTML,
          attributionText: attributionText,
          code: code,
          copyright: copyright,
          etag: etag,
        );

  factory RequestSuccessModel.fromJson(Map<String, dynamic> json) =>
      RequestSuccessModel(
          code: json['code'],
          status: json['status'],
          copyright: json['copyright'],
          attributionText: json['attributionText'],
          attributionHTML: json['attributionHTML'],
          etag: json['etag'],
          data: DataModel.fromJson(json['data']));
}
