import 'package:dartz/dartz.dart';
import 'package:pilar_mobile_challenge/app/data/models/movie_details.dart';
import 'package:pilar_mobile_challenge/app/domain/entities/get_movie_details_use_case_params.dart';
import 'package:pilar_mobile_challenge/app/domain/repositories/movies_repository.dart';
import 'package:pilar_mobile_challenge/shared/failures/failure.dart';
import 'package:pilar_mobile_challenge/shared/usecases/future_usecase.dart';

class GetMovieDetailsUseCase
    implements FutureUseCase<MovieDetails, GetMovieDetailsUseCaseParams> {
  final MoviesRepository repository;

  GetMovieDetailsUseCase(this.repository);

  @override
  Future<Either<Failure, MovieDetails>> call(
    GetMovieDetailsUseCaseParams param,
  ) {
    return repository.getMovieDetails(
      param.movieId,
      param.language,
    );
  }
}
