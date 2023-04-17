import 'package:desafio_marvel/app/modules/marvel_characters_list/domain/entities/data.dart';

class RequestSuccess {
  final int code;
  final String status;
  final String copyright;
  final String attributionText;
  final String attributionHTML;
  final String etag;
  final Data data;

  const RequestSuccess(
      {required this.code,
      required this.status,
      required this.copyright,
      required this.attributionText,
      required this.attributionHTML,
      required this.etag,
      required this.data});
}
