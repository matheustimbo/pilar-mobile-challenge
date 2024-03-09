import 'package:dartz/dartz.dart';
import 'package:pilar_mobile_challenge/app/data/models/movies_list_response.dart';
import 'package:pilar_mobile_challenge/app/di.dart';
import 'package:pilar_mobile_challenge/app/domain/entities/get_movies_list_use_case_params.dart';
import 'package:pilar_mobile_challenge/app/domain/usecases/get_not_playing_movies_list_use_case.dart';
import 'package:pilar_mobile_challenge/app/domain/usecases/get_popular_movies_list_use_case.dart';
import 'package:pilar_mobile_challenge/app/domain/usecases/get_top_rated_movies_list_use_case.dart';
import 'package:pilar_mobile_challenge/app/presentation/stores/movie_list_page_store.dart';
import 'package:pilar_mobile_challenge/app/presentation/stores/movie_list_store.dart';
import 'package:pilar_mobile_challenge/shared/failures/failure.dart';
import 'package:pilar_mobile_challenge/shared/utils/dartz_x.dart';

class MovieListPageController {
  final MovieListPageStore store;

  MovieListPageController({required this.store});

  final _getPopularMoviesListUseCase = DI.get<GetPopularMoviesListUseCase>();
  final _getTopRatedMoviesListUseCase = DI.get<GetTopRatedMoviesListUseCase>();
  final _getNowPlayingMoviesListUseCase =
      DI.get<GetNowPlayingMoviesListUseCase>();

  Future<void> fetchInitialPopularMoviesList() => _fetchInitialMovieList(
        store.popularMovies,
        _getPopularMoviesListUseCase.call,
      );

  Future<void> fetchInitialTopRatedMoviesList() => _fetchInitialMovieList(
        store.topRatedMovies,
        _getTopRatedMoviesListUseCase.call,
      );

  Future<void> fetchInitialNowPlayingMoviesList() => _fetchInitialMovieList(
        store.nowPlayingMovies,
        _getNowPlayingMoviesListUseCase.call,
      );

  Future<void> _fetchInitialMovieList(
    MovieListStore store,
    Future<Either<Failure, MoviesListResponse>> Function(
      GetMoviesListUseCaseParams param,
    ) fetchMovies,
  ) async {
    if (store.isLoadingInitialMovieList) return;
    store.setIsLoadingInitialMovieList(true);
    store.setHasErrorLoadingInitialMovieList(false);
    final result = await fetchMovies(
        GetMoviesListUseCaseParams(page: 1, language: 'pt-BR'));
    result.fold((failure) {
      store.setHasErrorLoadingInitialMovieList(true);
    }, (response) {
      store.setMovies(response.results);
      store.setLastFetchedPage(response.page);
      store.setTotalPages(response.total_pages);
    });
    store.setIsLoadingInitialMovieList(false);
  }

  Future<void> fetchMorePopularMovies() =>
      _fetchMoreMovies(store.popularMovies, _getPopularMoviesListUseCase.call);

  Future<void> fetchMoreTopRatedMovies() => _fetchMoreMovies(
      store.topRatedMovies, _getTopRatedMoviesListUseCase.call);

  Future<void> fetchMoreNowPlayingMovies() => _fetchMoreMovies(
      store.nowPlayingMovies, _getNowPlayingMoviesListUseCase.call);

  Future<void> _fetchMoreMovies(
    MovieListStore store,
    Future<Either<Failure, MoviesListResponse>> Function(
      GetMoviesListUseCaseParams param,
    ) fetchMovies,
  ) async {
    final hasReachedEndOfList = store.totalPages != null &&
        store.lastFetchedPage != null &&
        store.lastFetchedPage! >= store.totalPages!;
    if (hasReachedEndOfList || store.isLoadingMoreMovies) {
      return;
    }
    store.setIsLoadingMoreMovies(true);
    final result = await fetchMovies(
      GetMoviesListUseCaseParams(
        page: ((store.lastFetchedPage ?? 0) + 1),
        language: 'pt-BR',
      ),
    );
    if (result.isRight()) {
      final response = result.asRight();
      store.setMovies([...store.movieList, ...response.results]);
      store.setLastFetchedPage(response.page);
    }
    store.setIsLoadingMoreMovies(false);
  }
}
