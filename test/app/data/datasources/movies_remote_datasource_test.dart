import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pilar_mobile_challenge/app/data/datasources/movies_remote_datasource.dart';
import 'package:pilar_mobile_challenge/app/data/models/movie_credits.dart';
import 'package:pilar_mobile_challenge/app/data/models/movie_details.dart';
import 'package:pilar_mobile_challenge/app/data/models/movies_list_response.dart';

import 'movies_remote_datasource_test.mocks.dart';

@GenerateNiceMocks([MockSpec<Dio>()])
void main() {
  late MoviesRemoteDatasource moviesRemoteDatasource;
  late MockDio mockDio;

  setUpAll(() {
    mockDio = MockDio();
    moviesRemoteDatasource = MoviesRemoteDatasourceImpl(mockDio);
  });

  final exampleMovieListRawData = {
    'page': 1,
    'results': [],
    'total_pages': 10,
    'total_results': 100,
  };

  final exampleMovieListParsedData =
      MoviesListResponse.fromJson(exampleMovieListRawData);

  final exampleMovieDetailsRawData = {
    'id': 1,
    'genres': [
      {'id': 3, 'name': 'Ação'}
    ],
    'runtime': 120,
    'tagline': 'Tagline',
  };

  final exampleMovieDetailsParsedData =
      MovieDetails.fromJson(exampleMovieDetailsRawData);

  final exampleMovieCastRawData = {
    'id': 1,
    'name': 'Name',
    'character': 'Character',
    'profile_path': 'profile_path',
  };

  final exampleMovieCreditsRawData = {
    'id': 1,
    'cast': [exampleMovieCastRawData],
  };

  final exampleMovieCreditsParsedData =
      MovieCredits.fromJson(exampleMovieCreditsRawData);

  group('MoviesRemoteDatasource', () {
    group('getPopularMovies', () {
      test('should get popular movies from remote datasource', () async {
        when(mockDio.get('/movie/popular', queryParameters: {
          'page': 1,
          'language': 'en-US',
        })).thenAnswer(
          (_) async => Response(
            statusCode: 200,
            data: exampleMovieListRawData,
            requestOptions: RequestOptions(),
          ),
        );

        final result =
            await moviesRemoteDatasource.getPopularMovies(1, 'en-US');

        expect(result, equals(exampleMovieListParsedData));
        verify(mockDio.get('/movie/popular', queryParameters: {
          'page': 1,
          'language': 'en-US',
        }));
        verifyNoMoreInteractions(mockDio);
      });

      test('should throw exception if API returns error', () async {
        when(mockDio.get(any, queryParameters: anyNamed('queryParameters')))
            .thenThrow(DioException(
          requestOptions: RequestOptions(),
        ));

        final result = moviesRemoteDatasource.getPopularMovies(1, 'en-US');

        expect(result, throwsA(isA<DioException>()));

        verify(mockDio.get('/movie/popular', queryParameters: {
          'page': 1,
          'language': 'en-US',
        }));
        verifyNoMoreInteractions(mockDio);
      });
    });

    group('getTopRatedMovies', () {
      test('should get top rated movies from remote datasource', () async {
        when(mockDio.get('/movie/top_rated', queryParameters: {
          'page': 1,
          'language': 'en-US',
        })).thenAnswer(
          (_) async => Response(
            statusCode: 200,
            data: exampleMovieListRawData,
            requestOptions: RequestOptions(),
          ),
        );

        final result =
            await moviesRemoteDatasource.getTopRatedMovies(1, 'en-US');

        expect(result, equals(exampleMovieListParsedData));
        verify(mockDio.get('/movie/top_rated', queryParameters: {
          'page': 1,
          'language': 'en-US',
        }));
        verifyNoMoreInteractions(mockDio);
      });

      test('should throw exception if API returns error', () async {
        when(mockDio.get('/movie/top_rated', queryParameters: {
          'page': 1,
          'language': 'en-US',
        })).thenThrow(DioException(requestOptions: RequestOptions()));

        expect(
          () => moviesRemoteDatasource.getTopRatedMovies(1, 'en-US'),
          throwsException,
        );

        verify(mockDio.get('/movie/top_rated', queryParameters: {
          'page': 1,
          'language': 'en-US',
        }));
        verifyNoMoreInteractions(mockDio);
      });
    });

    group('getNowPlayingMovies', () {
      test('should get now playing movies from remote datasource', () async {
        when(mockDio.get('/movie/now_playing', queryParameters: {
          'page': 1,
          'language': 'en-US',
        })).thenAnswer(
          (_) async => Response(
            statusCode: 200,
            data: exampleMovieListRawData,
            requestOptions: RequestOptions(),
          ),
        );

        final result =
            await moviesRemoteDatasource.getNowPlayingMovies(1, 'en-US');

        expect(result, equals(exampleMovieListParsedData));
        verify(mockDio.get('/movie/now_playing', queryParameters: {
          'page': 1,
          'language': 'en-US',
        }));
        verifyNoMoreInteractions(mockDio);
      });

      test('should throw exception if API returns error', () async {
        when(mockDio.get('/movie/now_playing', queryParameters: {
          'page': 1,
          'language': 'en-US',
        })).thenThrow(DioException(requestOptions: RequestOptions()));

        expect(
          () => moviesRemoteDatasource.getNowPlayingMovies(1, 'en-US'),
          throwsException,
        );

        verify(mockDio.get('/movie/now_playing', queryParameters: {
          'page': 1,
          'language': 'en-US',
        }));
        verifyNoMoreInteractions(mockDio);
      });
    });

    group('searchMoviesByTitle', () {
      test('should search movies by title from remote datasource', () async {
        when(mockDio.get('/search/movie', queryParameters: {
          'query': 'query',
          'page': 1,
          'language': 'en-US',
        })).thenAnswer(
          (_) async => Response(
            statusCode: 200,
            data: exampleMovieListRawData,
            requestOptions: RequestOptions(),
          ),
        );

        final result = await moviesRemoteDatasource.searchMoviesByTitle(
            'query', 1, 'en-US');

        expect(result, equals(exampleMovieListParsedData));
        verify(mockDio.get('/search/movie', queryParameters: {
          'query': 'query',
          'page': 1,
          'language': 'en-US',
        }));
        verifyNoMoreInteractions(mockDio);
      });

      test('should throw exception if API returns error', () async {
        when(mockDio.get('/search/movie', queryParameters: {
          'query': 'query',
          'page': 1,
          'language': 'en-US',
        })).thenThrow(DioException(requestOptions: RequestOptions()));

        expect(
          () => moviesRemoteDatasource.searchMoviesByTitle('query', 1, 'en-US'),
          throwsException,
        );

        verify(mockDio.get('/search/movie', queryParameters: {
          'query': 'query',
          'page': 1,
          'language': 'en-US',
        }));
        verifyNoMoreInteractions(mockDio);
      });
    });

    group('getMovieDetails', () {
      test('should get movie details from remote datasource', () async {
        when(mockDio.get('/movie/1', queryParameters: {
          'language': 'en-US',
        })).thenAnswer(
          (_) async => Response(
            statusCode: 200,
            data: exampleMovieDetailsRawData,
            requestOptions: RequestOptions(),
          ),
        );

        final result = await moviesRemoteDatasource.getMovieDetails(1, 'en-US');

        expect(result, equals(exampleMovieDetailsParsedData));
        verify(mockDio.get('/movie/1', queryParameters: {
          'language': 'en-US',
        }));
        verifyNoMoreInteractions(mockDio);
      });

      test('should throw exception if API returns error', () async {
        when(mockDio.get('/movie/1', queryParameters: {
          'language': 'en-US',
        })).thenThrow(DioException(requestOptions: RequestOptions()));

        expect(
          () => moviesRemoteDatasource.getMovieDetails(1, 'en-US'),
          throwsException,
        );

        verify(mockDio.get('/movie/1', queryParameters: {
          'language': 'en-US',
        }));
        verifyNoMoreInteractions(mockDio);
      });
    });

    group('getMovieCredits', () {
      test('should get movie credits from remote datasource', () async {
        when(mockDio.get('/movie/1/credits', queryParameters: {
          'language': 'en-US',
        })).thenAnswer(
          (_) async => Response(
            statusCode: 200,
            data: exampleMovieCreditsRawData,
            requestOptions: RequestOptions(),
          ),
        );

        final result = await moviesRemoteDatasource.getMovieCredits(1, 'en-US');

        expect(result, equals(exampleMovieCreditsParsedData));
        verify(mockDio.get('/movie/1/credits', queryParameters: {
          'language': 'en-US',
        }));
        verifyNoMoreInteractions(mockDio);
      });

      test('should throw exception if API returns error', () async {
        when(mockDio.get('/movie/1/credits', queryParameters: {
          'language': 'en-US',
        })).thenThrow(DioException(requestOptions: RequestOptions()));

        expect(
          () => moviesRemoteDatasource.getMovieCredits(1, 'en-US'),
          throwsException,
        );

        verify(mockDio.get('/movie/1/credits', queryParameters: {
          'language': 'en-US',
        }));
        verifyNoMoreInteractions(mockDio);
      });
    });
  });
}
