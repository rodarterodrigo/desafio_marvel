import 'package:desafio_marvel/app/core/config/config.dart';
import 'package:desafio_marvel/app/core/packages/request_client.dart';
import 'package:desafio_marvel/app/core/shared/modules/infrastructure/exceptions/forbiden_exception.dart';
import 'package:desafio_marvel/app/core/shared/modules/infrastructure/exceptions/generic_exception.dart';
import 'package:desafio_marvel/app/core/shared/modules/infrastructure/exceptions/invalid_key_exception.dart';
import 'package:desafio_marvel/app/core/shared/modules/infrastructure/exceptions/method_not_allowed_exception.dart';
import 'package:desafio_marvel/app/core/shared/modules/infrastructure/exceptions/missing_parameter_exception.dart';
import 'package:desafio_marvel/app/modules/marvel_characters_list/external/settings/marvel_character_list_settings.dart';
import 'package:desafio_marvel/app/modules/marvel_characters_list/infrastructure/datasources/get_character_list_datasource.dart';

class GetCharacterListDatasourceImplementation
    implements GetCharacterListDatasource {
  final RequestClient client;

  const GetCharacterListDatasourceImplementation(this.client);

  @override
  Future<Map<String, dynamic>> getCharacterList(int offset, int limit) async {
    final response = await client.get('${ConfigAbstraction.server}'
        '${MarvelCharacterListSettings.endPoint}'
        '?ts=${ConfigAbstraction.timeStamp}'
        '&apikey=${ConfigAbstraction.key}'
        '&hash=${ConfigAbstraction.hash}'
        '&limit=$limit'
        '&offset=$offset');

    switch (response.statusCode) {
      case 200:
        return response.data;
      case 409:
        throw MissingParameterException(response.data['message'].toString());
      case 401:
        throw InvalidKeyException(response.data['message'].toString());
      case 405:
        throw MethodNotAllowedException(response.data['message'].toString());
      case 403:
        throw ForbidenException(response.data['message'].toString());
      default:
        throw const GenericException('Houve um erro interno');
    }
  }
}
