import 'package:dartz/dartz.dart';
import 'package:pilar_mobile_challenge/app/data/models/movie_credits.dart';
import 'package:pilar_mobile_challenge/app/domain/entities/get_movie_credits_use_case_params.dart';
import 'package:pilar_mobile_challenge/app/domain/repositories/movies_repository.dart';
import 'package:pilar_mobile_challenge/shared/failures/failure.dart';
import 'package:pilar_mobile_challenge/shared/usecases/future_usecase.dart';

class GetMovieCreditsUseCase
    implements FutureUseCase<MovieCredits, GetMovieCreditsUseCaseParams> {
  final MoviesRepository moviesRepository;

  GetMovieCreditsUseCase(this.moviesRepository);

  @override
  Future<Either<Failure, MovieCredits>> call(
      GetMovieCreditsUseCaseParams param) {
    return moviesRepository.getMovieCredits(param.movieId, param.language);
  }
}
