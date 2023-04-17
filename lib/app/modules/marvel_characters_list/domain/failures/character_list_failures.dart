import 'package:desafio_marvel/app/core/shared/modules/domain/failures/general_failures.dart';

class CharacterListFailures implements GeneralFailures {
  @override
  final String message;

  const CharacterListFailures(this.message);
}
