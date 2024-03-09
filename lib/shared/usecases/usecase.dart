import 'package:dartz/dartz.dart';
import 'package:pilar_mobile_challenge/shared/failures/failure.dart';

abstract class UseCase<ReturnType, Params> {
  Either<Failure, ReturnType> call(Params param);
}

class NoParams {
  const NoParams();
}
