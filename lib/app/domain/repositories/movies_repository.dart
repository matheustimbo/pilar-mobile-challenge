import 'package:dartz/dartz.dart';
import 'package:pilar_mobile_challenge/app/data/models/movie_credits.dart';
import 'package:pilar_mobile_challenge/app/data/models/movie_details.dart';
import 'package:pilar_mobile_challenge/app/data/models/movies_list_response.dart';
import 'package:pilar_mobile_challenge/shared/failures/failure.dart';

abstract class MoviesRepository {
  Future<Either<Failure, MoviesListResponse>> getPopularMovies(
    int page,
    String language,
  );
  Future<Either<Failure, MoviesListResponse>> getTopRatedMovies(
    int page,
    String language,
  );
  Future<Either<Failure, MoviesListResponse>> getNowPlayingMovies(
    int page,
    String language,
  );
  Future<Either<Failure, MoviesListResponse>> searchMoviesByTitle(
    String query,
    int page,
    String language,
  );
  Future<Either<Failure, MovieDetails>> getMovieDetails(
    int movieId,
    String language,
  );
  Future<Either<Failure, MovieCredits>> getMovieCredits(
    int movieId,
    String language,
  );
}
