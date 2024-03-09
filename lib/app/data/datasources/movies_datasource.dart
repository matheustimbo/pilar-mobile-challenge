import 'package:dio/dio.dart';
import 'package:pilar_mobile_challenge/app/data/models/movie_credits.dart';
import 'package:pilar_mobile_challenge/app/data/models/movie_details.dart';
import 'package:pilar_mobile_challenge/app/data/models/movies_list_response.dart';

abstract class MoviesDatasource {
  Future<MoviesListResponse> getPopularMovies(
    int page,
    String language,
  );
  Future<MoviesListResponse> getTopRatedMovies(
    int page,
    String language,
  );
  Future<MoviesListResponse> getNowPlayingMovies(
    int page,
    String language,
  );
  Future<MoviesListResponse> searchMoviesByTitle(
    String query,
    int page,
    String language,
  );
  Future<MovieDetails> getMovieDetails(int movieId, String language);
  Future<MovieCredits> getMovieCredits(int movieId, String language);
}

class MoviesDatasourceImpl implements MoviesDatasource {
  final Dio _dio;

  MoviesDatasourceImpl(this._dio);

  @override
  Future<MoviesListResponse> getPopularMovies(
    int page,
    String language,
  ) async {
    final response = await _dio.get('/movie/popular', queryParameters: {
      'page': page,
      'language': language,
    });
    return MoviesListResponse.fromJson(response.data);
  }

  @override
  Future<MoviesListResponse> getTopRatedMovies(
    int page,
    String language,
  ) async {
    final response = await _dio.get('/movie/top_rated', queryParameters: {
      'page': page,
      'language': language,
    });
    return MoviesListResponse.fromJson(response.data);
  }

  @override
  Future<MoviesListResponse> getNowPlayingMovies(
      int page, String language) async {
    final response = await _dio.get('/movie/now_playing', queryParameters: {
      'page': page,
      'language': language,
    });
    return MoviesListResponse.fromJson(response.data);
  }

  @override
  Future<MoviesListResponse> searchMoviesByTitle(
    String title,
    int page,
    String language,
  ) async {
    final response = await _dio.get('/search/movie', queryParameters: {
      'page': page,
      'language': language,
      'query': title,
    });
    return MoviesListResponse.fromJson(response.data);
  }

  @override
  Future<MovieDetails> getMovieDetails(int movieId, String language) async {
    final response = await _dio.get('/movie/$movieId', queryParameters: {
      'language': language,
    });

    return MovieDetails.fromJson(response.data);
  }

  @override
  Future<MovieCredits> getMovieCredits(int movieId, String language) async {
    final response =
        await _dio.get('/movie/$movieId/credits', queryParameters: {
      'language': language,
    });

    return MovieCredits.fromJson(response.data);
  }
}
