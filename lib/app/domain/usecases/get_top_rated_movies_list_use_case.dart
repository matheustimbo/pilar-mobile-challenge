import 'package:dartz/dartz.dart';
import 'package:pilar_mobile_challenge/app/data/models/movies_list_response.dart';
import 'package:pilar_mobile_challenge/app/domain/entities/get_movies_list_use_case_params.dart';
import 'package:pilar_mobile_challenge/app/domain/repositories/movies_repository.dart';
import 'package:pilar_mobile_challenge/shared/failures/failure.dart';
import 'package:pilar_mobile_challenge/shared/usecases/future_usecase.dart';

class GetTopRatedMoviesListUseCase
    implements FutureUseCase<MoviesListResponse, GetMoviesListUseCaseParams> {
  final MoviesRepository _moviesRemoteRepository;

  GetTopRatedMoviesListUseCase(this._moviesRemoteRepository);

  @override
  Future<Either<Failure, MoviesListResponse>> call(
    GetMoviesListUseCaseParams param,
  ) {
    return _moviesRemoteRepository.getTopRatedMovies(
      param.page,
      param.language,
    );
  }
}
