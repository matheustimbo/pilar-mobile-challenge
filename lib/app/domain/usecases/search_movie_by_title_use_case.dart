import 'package:dartz/dartz.dart';
import 'package:pilar_mobile_challenge/app/data/models/movies_list_response.dart';
import 'package:pilar_mobile_challenge/app/domain/entities/search_movie_by_title_use_case_params.dart';
import 'package:pilar_mobile_challenge/app/domain/repositories/movies_repository.dart';
import 'package:pilar_mobile_challenge/shared/failures/failure.dart';
import 'package:pilar_mobile_challenge/shared/usecases/future_usecase.dart';

class SearchMovieByTitleUseCase
    implements
        FutureUseCase<MoviesListResponse, SearchMovieByTitleUseCaseParams> {
  final MoviesRepository _moviesRemoteRepository;

  SearchMovieByTitleUseCase(this._moviesRemoteRepository);

  @override
  Future<Either<Failure, MoviesListResponse>> call(
      SearchMovieByTitleUseCaseParams param) {
    return _moviesRemoteRepository.searchMoviesByTitle(
      param.query,
      param.page,
      param.language,
    );
  }
}
