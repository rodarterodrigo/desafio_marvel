import 'package:desafio_marvel/app/core/shared/modules/domain/failures/general_failures.dart';

class ForbidenFailure implements GeneralFailures {
  @override
  final String message;

  const ForbidenFailure(this.message);
}
