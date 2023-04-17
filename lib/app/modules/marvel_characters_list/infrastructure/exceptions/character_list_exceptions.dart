import 'package:desafio_marvel/app/core/shared/modules/infrastructure/exceptions/general_exceptions.dart';

abstract class CharacterListExceptions implements GeneralExceptions {
  @override
  final String message;

  const CharacterListExceptions(this.message);
}
