import 'package:desafio_marvel/app/core/packages/request_client.dart';
import 'package:desafio_marvel/app/core/shared/modules/infrastructure/exceptions/generic_exception.dart';
import 'package:desafio_marvel/app/modules/character_detail/infrastructure/datasources/get_comic_detail_list_datasource.dart';
import 'package:desafio_marvel/app/modules/character_detail/infrastructure/models/comic_data_model.dart';
import 'package:desafio_marvel/app/modules/marvel_characters_list/infrastructure/exceptions/forbiden_exception.dart';

class GetComicDetailListDatasourceImplementation
    implements GetComicDetailListDatasource {
  final RequestClient client;

  const GetComicDetailListDatasourceImplementation(this.client);

  @override
  Future<ComicDataModel> getComicList(String url) async {
    final response = await client.get(url);

    switch (response.statusCode) {
      case 200:
        return ComicDataModel.fromJson(response.data['data']);
      case 403:
        throw const ForbidenException('Acesso restrito');
      default:
        throw const GenericException('Houve um erro interno');
    }
  }
}
