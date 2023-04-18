import 'package:desafio_marvel/app/core/config/config.dart';
import 'package:desafio_marvel/app/core/packages/request_client.dart';
import 'package:desafio_marvel/app/core/shared/modules/infrastructure/exceptions/forbiden_exception.dart';
import 'package:desafio_marvel/app/core/shared/modules/infrastructure/exceptions/generic_exception.dart';
import 'package:desafio_marvel/app/modules/character_detail/infrastructure/datasources/get_comic_detail_list_datasource.dart';
import 'package:desafio_marvel/app/modules/character_detail/infrastructure/models/comic_data_model.dart';

class GetComicDetailListDatasourceImplementation
    implements GetComicDetailListDatasource {
  final RequestClient client;

  const GetComicDetailListDatasourceImplementation(this.client);

  @override
  Future<ComicDataModel> getComicList(String url, int offset, int limit) async {
    final response = await client.get('$url'
        '?ts=${ConfigAbstraction.timeStamp}'
        '&apikey=${ConfigAbstraction.key}'
        '&hash=${ConfigAbstraction.hash}'
        '&limit=$limit'
        '&offset=$offset');

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
