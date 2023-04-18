import 'package:desafio_marvel/app/modules/character_detail/infrastructure/models/comic_data_model.dart';

abstract class GetComicDetailListDatasource {
  Future<ComicDataModel> getComicList(String url, int offset, int limit);
}
