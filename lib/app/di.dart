import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:pilar_mobile_challenge/app/data/datasources/movies_datasource.dart';
import 'package:pilar_mobile_challenge/app/data/repositories/movies_repository_impl.dart';
import 'package:pilar_mobile_challenge/app/domain/repositories/movies_repository.dart';
import 'package:pilar_mobile_challenge/app/domain/usecases/get_movie_credits_use_case.dart';
import 'package:pilar_mobile_challenge/app/domain/usecases/get_movie_details_use_case.dart';
import 'package:pilar_mobile_challenge/app/domain/usecases/get_not_playing_movies_list_use_case.dart';
import 'package:pilar_mobile_challenge/app/domain/usecases/get_popular_movies_list_use_case.dart';
import 'package:pilar_mobile_challenge/app/domain/usecases/get_top_rated_movies_list_use_case.dart';
import 'package:pilar_mobile_challenge/app/domain/usecases/search_movie_by_title_use_case.dart';
import 'package:pilar_mobile_challenge/app/presentation/stores/movie_search_page_store.dart';
import 'package:pilar_mobile_challenge/shared/utils/constants.dart';

class DI {
  static T get<T extends Object>({
    String? instanceName,
    dynamic param1,
    dynamic param2,
    Type? type,
  }) =>
      GetIt.instance.get<T>(
        instanceName: instanceName,
        param1: param1,
        param2: param2,
        type: type,
      );

  static setup() {
    final getIt = GetIt.instance;

    //shared
    getIt.registerLazySingleton(
      () => Dio(
        BaseOptions(baseUrl: Constants.apiBaseUrl, headers: {
          'Authorization': 'Bearer ${dotenv.env['TMDB_API_KEY']}',
        }),
      ),
    );

    //datasources
    getIt.registerLazySingleton<MoviesDatasource>(
        () => MoviesDatasourceImpl(getIt.get()));

    //repositories
    getIt.registerLazySingleton<MoviesRepository>(
        () => MoviesRepositoryImpl(getIt.get()));

    //usecases
    getIt.registerLazySingleton(() => GetPopularMoviesListUseCase(getIt.get()));
    getIt
        .registerLazySingleton(() => GetTopRatedMoviesListUseCase(getIt.get()));
    getIt.registerLazySingleton(
        () => GetNowPlayingMoviesListUseCase(getIt.get()));
    getIt.registerLazySingleton(() => SearchMovieByTitleUseCase(getIt.get()));
    getIt.registerLazySingleton(() => GetMovieDetailsUseCase(getIt.get()));
    getIt.registerLazySingleton(() => GetMovieCreditsUseCase(getIt.get()));

    //stores
    getIt.registerLazySingleton(() => MovieSearchPageStore());
  }
}
