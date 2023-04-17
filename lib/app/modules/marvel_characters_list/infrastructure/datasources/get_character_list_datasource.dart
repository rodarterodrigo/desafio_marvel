import 'package:desafio_marvel/app/modules/marvel_characters_list/infrastructure/models/request_success_model.dart';

abstract class GetCharacterListDatasource {
  Future<RequestSuccessModel> getCharacterList(int offset, int limit);
}
