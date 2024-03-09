import 'package:dartz/dartz.dart';
import 'package:pilar_mobile_challenge/shared/failures/failure.dart';

abstract class FutureUseCase<ReturnType, Params> {
  Future<Either<Failure, ReturnType>> call(Params param);
}
