import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pilar_mobile_challenge/app/data/datasources/movies_datasource.dart';
import 'package:pilar_mobile_challenge/app/data/models/movie_credits.dart';
import 'package:pilar_mobile_challenge/app/data/models/movie_details.dart';
import 'package:pilar_mobile_challenge/app/data/models/movies_list_response.dart';
import 'package:pilar_mobile_challenge/app/data/repositories/movies_repository_impl.dart';
import 'package:pilar_mobile_challenge/shared/failures/failure.dart';

import 'movies_repository_impl_test.mocks.dart';

@GenerateNiceMocks([MockSpec<MoviesDatasource>()])
void main() {
  late MockMoviesDatasource mockMoviesRemoteDatasource;
  late MoviesRepositoryImpl moviesRepositoryImpl;

  setUpAll(() {
    mockMoviesRemoteDatasource = MockMoviesDatasource();
    moviesRepositoryImpl = MoviesRepositoryImpl(mockMoviesRemoteDatasource);
  });

  final exampleMovieListResponse = MoviesListResponse(
    page: 1,
    results: [],
    total_pages: 10,
    total_results: 100,
  );

  final exampleMovieDetailsResponse = MovieDetails(
    id: 1,
    genres: [],
    runtime: 120,
    tagline: '',
    title: 'Title 1',
    adult: false,
    vote_average: 10,
    poster_path: '',
    release_date: DateTime.now(),
    overview: '',
    backdrop_path: '',
  );

  final exampleMovieCreditsResponse = MovieCredits(
    id: 1,
    cast: [],
  );

  group('MoviesRepositoryImpl', () {
    group('getPopularMovies', () {
      test('should get popular movies from remote datasource', () async {
        when(mockMoviesRemoteDatasource.getPopularMovies(any, any))
            .thenAnswer((_) async => exampleMovieListResponse);

        final result = await moviesRepositoryImpl.getPopularMovies(1, 'en-US');

        expect(result, equals(Right(exampleMovieListResponse)));
        verify(mockMoviesRemoteDatasource.getPopularMovies(1, 'en-US'));
        verifyNoMoreInteractions(mockMoviesRemoteDatasource);
      });

      test('should return failure if remote datasource throws exception',
          () async {
        when(mockMoviesRemoteDatasource.getPopularMovies(any, any))
            .thenThrow((_) async => Exception());

        final result = await moviesRepositoryImpl.getPopularMovies(1, 'en-US');

        expect(result, equals(Left(Failure())));
        verify(mockMoviesRemoteDatasource.getPopularMovies(1, 'en-US'));
        verifyNoMoreInteractions(mockMoviesRemoteDatasource);
      });
    });

    group('getTopRatedMovies', () {
      test('should get top rated movies from remote datasource', () async {
        when(mockMoviesRemoteDatasource.getTopRatedMovies(any, any))
            .thenAnswer((_) async => exampleMovieListResponse);

        final result = await moviesRepositoryImpl.getTopRatedMovies(1, 'en-US');

        expect(result, equals(Right(exampleMovieListResponse)));
        verify(mockMoviesRemoteDatasource.getTopRatedMovies(1, 'en-US'));
        verifyNoMoreInteractions(mockMoviesRemoteDatasource);
      });

      test('should return failure if remote datasource throws exception',
          () async {
        when(mockMoviesRemoteDatasource.getTopRatedMovies(any, any))
            .thenThrow((_) async => Exception());

        final result = await moviesRepositoryImpl.getTopRatedMovies(1, 'en-US');

        expect(result, equals(Left(Failure())));
        verify(mockMoviesRemoteDatasource.getTopRatedMovies(1, 'en-US'));
        verifyNoMoreInteractions(mockMoviesRemoteDatasource);
      });
    });

    group('getNowPlayingMovies', () {
      test('should get now playing movies from remote datasource', () async {
        when(mockMoviesRemoteDatasource.getNowPlayingMovies(any, any))
            .thenAnswer((_) async => exampleMovieListResponse);

        final result =
            await moviesRepositoryImpl.getNowPlayingMovies(1, 'en-US');

        expect(result, equals(Right(exampleMovieListResponse)));
        verify(mockMoviesRemoteDatasource.getNowPlayingMovies(1, 'en-US'));
        verifyNoMoreInteractions(mockMoviesRemoteDatasource);
      });

      test('should return failure if remote datasource throws exception',
          () async {
        when(mockMoviesRemoteDatasource.getNowPlayingMovies(any, any))
            .thenThrow((_) async => Exception());

        final result =
            await moviesRepositoryImpl.getNowPlayingMovies(1, 'en-US');

        expect(result, equals(Left(Failure())));
        verify(mockMoviesRemoteDatasource.getNowPlayingMovies(1, 'en-US'));
        verifyNoMoreInteractions(mockMoviesRemoteDatasource);
      });
    });

    group('searchMoviesByTitle', () {
      test('should search movies by title from remote datasource', () async {
        when(mockMoviesRemoteDatasource.searchMoviesByTitle(any, any, any))
            .thenAnswer((_) async => exampleMovieListResponse);

        final result =
            await moviesRepositoryImpl.searchMoviesByTitle('title', 1, 'en-US');

        expect(result, equals(Right(exampleMovieListResponse)));
        verify(mockMoviesRemoteDatasource.searchMoviesByTitle(
            'title', 1, 'en-US'));
        verifyNoMoreInteractions(mockMoviesRemoteDatasource);
      });

      test('should return failure if remote datasource throws exception',
          () async {
        when(mockMoviesRemoteDatasource.searchMoviesByTitle(any, any, any))
            .thenThrow((_) async => Exception());

        final result =
            await moviesRepositoryImpl.searchMoviesByTitle('title', 1, 'en-US');

        expect(result, equals(Left(Failure())));
        verify(mockMoviesRemoteDatasource.searchMoviesByTitle(
            'title', 1, 'en-US'));
        verifyNoMoreInteractions(mockMoviesRemoteDatasource);
      });
    });

    group('getMovieDetails', () {
      test('should get movie details from remote datasource', () async {
        when(mockMoviesRemoteDatasource.getMovieDetails(any, any))
            .thenAnswer((_) async => exampleMovieDetailsResponse);

        final result = await moviesRepositoryImpl.getMovieDetails(1, 'pt-BR');

        expect(result, equals(Right(exampleMovieDetailsResponse)));
        verify(mockMoviesRemoteDatasource.getMovieDetails(1, 'pt-BR'));
        verifyNoMoreInteractions(mockMoviesRemoteDatasource);
      });

      test('should return failure if remote datasource throws exception',
          () async {
        when(mockMoviesRemoteDatasource.getMovieDetails(any, any))
            .thenThrow((_) async => Exception());

        final result = await moviesRepositoryImpl.getMovieDetails(1, 'pt-BR');

        expect(result, equals(Left(Failure())));
        verify(mockMoviesRemoteDatasource.getMovieDetails(1, 'pt-BR'));
        verifyNoMoreInteractions(mockMoviesRemoteDatasource);
      });
    });

    group('getMovieCredits', () {
      test('should get movie credits from remote datasource', () async {
        when(mockMoviesRemoteDatasource.getMovieCredits(any, any))
            .thenAnswer((_) async => exampleMovieCreditsResponse);

        final result = await moviesRepositoryImpl.getMovieCredits(1, 'pt-BR');

        expect(result, equals(Right(exampleMovieCreditsResponse)));
        verify(mockMoviesRemoteDatasource.getMovieCredits(1, 'pt-BR'));
        verifyNoMoreInteractions(mockMoviesRemoteDatasource);
      });

      test('should return failure if remote datasource throws exception',
          () async {
        when(mockMoviesRemoteDatasource.getMovieCredits(any, any))
            .thenThrow((_) async => Exception());

        final result = await moviesRepositoryImpl.getMovieCredits(1, 'pt-BR');

        expect(result, equals(Left(Failure())));
        verify(mockMoviesRemoteDatasource.getMovieCredits(1, 'pt-BR'));
        verifyNoMoreInteractions(mockMoviesRemoteDatasource);
      });
    });
  });
}
