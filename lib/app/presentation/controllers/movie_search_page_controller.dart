// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:pilar_mobile_challenge/app/di.dart';
import 'package:pilar_mobile_challenge/app/domain/entities/search_movie_by_title_use_case_params.dart';
import 'package:pilar_mobile_challenge/app/domain/usecases/search_movie_by_title_use_case.dart';
import 'package:pilar_mobile_challenge/app/presentation/stores/movie_search_page_store.dart';

class MovieSearchPageController {
  final MovieSearchPageStore store;

  MovieSearchPageController({
    required this.store,
  });

  final _searchMovieByTitleUseCase = DI.get<SearchMovieByTitleUseCase>();

  Future<void> searchInitialMovieList(String query) async {
    if (store.searchMovies.isLoadingInitialMovieList) return;
    store.searchMovies.setIsLoadingInitialMovieList(true);
    store.searchMovies.setHasErrorLoadingInitialMovieList(false);
    final result = await _searchMovieByTitleUseCase(
      SearchMovieByTitleUseCaseParams(
        page: 1,
        language: 'pt-BR',
        query: query,
      ),
    );
    result.fold((failure) {
      store.searchMovies.setHasErrorLoadingInitialMovieList(true);
    }, (response) {
      store.searchMovies.setMovies(response.results);
      store.searchMovies.setLastFetchedPage(response.page);
      store.searchMovies.setTotalPages(response.total_pages);
    });
    store.searchMovies.setIsLoadingInitialMovieList(false);
  }

  Future<void> searchMoreMovies(String query) async {
    final hasReachedEndOfList = store.searchMovies.totalPages != null &&
        store.searchMovies.lastFetchedPage != null &&
        store.searchMovies.lastFetchedPage! >= store.searchMovies.totalPages!;
    if (store.searchMovies.isLoadingMoreMovies || hasReachedEndOfList) return;
    store.searchMovies.setIsLoadingMoreMovies(true);
    final result = await _searchMovieByTitleUseCase(
      SearchMovieByTitleUseCaseParams(
        page: store.searchMovies.lastFetchedPage! + 1,
        language: 'pt-BR',
        query: query,
      ),
    );
    result.fold((failure) {
      store.searchMovies.setIsLoadingMoreMovies(false);
    }, (response) {
      store.searchMovies.setMovies(
        store.searchMovies.movieList + response.results,
      );
      store.searchMovies.setLastFetchedPage(response.page);
    });
    store.searchMovies.setIsLoadingMoreMovies(false);
  }
}
