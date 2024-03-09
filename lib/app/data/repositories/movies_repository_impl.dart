import 'package:dartz/dartz.dart';
import 'package:pilar_mobile_challenge/app/data/datasources/movies_datasource.dart';
import 'package:pilar_mobile_challenge/app/data/models/movie_credits.dart';
import 'package:pilar_mobile_challenge/app/data/models/movie_details.dart';
import 'package:pilar_mobile_challenge/app/data/models/movies_list_response.dart';
import 'package:pilar_mobile_challenge/app/domain/repositories/movies_repository.dart';
import 'package:pilar_mobile_challenge/shared/failures/failure.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  final MoviesDatasource _moviesRemoteDatasource;

  MoviesRepositoryImpl(this._moviesRemoteDatasource);

  @override
  Future<Either<Failure, MoviesListResponse>> getPopularMovies(
    int page,
    String language,
  ) async {
    try {
      return Right(
        await _moviesRemoteDatasource.getPopularMovies(page, language),
      );
    } catch (e) {
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, MoviesListResponse>> getTopRatedMovies(
    int page,
    String language,
  ) async {
    try {
      return Right(
        await _moviesRemoteDatasource.getTopRatedMovies(page, language),
      );
    } catch (e) {
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, MoviesListResponse>> getNowPlayingMovies(
    int page,
    String language,
  ) async {
    try {
      return Right(
        await _moviesRemoteDatasource.getNowPlayingMovies(page, language),
      );
    } catch (e) {
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, MoviesListResponse>> searchMoviesByTitle(
    String query,
    int page,
    String language,
  ) async {
    try {
      return Right(
        await _moviesRemoteDatasource.searchMoviesByTitle(
          query,
          page,
          language,
        ),
      );
    } catch (e) {
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, MovieDetails>> getMovieDetails(
    int movieId,
    String language,
  ) async {
    try {
      return Right(
        await _moviesRemoteDatasource.getMovieDetails(
          movieId,
          language,
        ),
      );
    } catch (e) {
      return Left(Failure());
    }
  }

  @override
  Future<Either<Failure, MovieCredits>> getMovieCredits(
    int movieId,
    String language,
  ) async {
    try {
      return Right(
        await _moviesRemoteDatasource.getMovieCredits(
          movieId,
          language,
        ),
      );
    } catch (e) {
      return Left(Failure());
    }
  }
}
