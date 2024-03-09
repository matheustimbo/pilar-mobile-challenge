import 'package:mobx/mobx.dart';
import 'package:pilar_mobile_challenge/app/data/models/movie_list_item.dart';

part 'movie_list_store.g.dart';

class MovieListStore = _MovieListStoreBase with _$MovieListStore;

abstract class _MovieListStoreBase with Store {
  @observable
  bool isLoadingInitialMovieList = false;

  @action
  void setIsLoadingInitialMovieList(bool b) => isLoadingInitialMovieList = b;

  @observable
  bool hasErrorLoadingInitialMovieList = false;

  @action
  void setHasErrorLoadingInitialMovieList(bool b) =>
      hasErrorLoadingInitialMovieList = b;

  @observable
  List<MovieListItem> movieList = [];

  @action
  void setMovies(List<MovieListItem> movies) => movieList = movies;

  @observable
  int? lastFetchedPage;

  @action
  void setLastFetchedPage(int? page) => lastFetchedPage = page;

  @observable
  int? totalPages;

  @action
  void setTotalPages(int? t) => totalPages = t;

  @observable
  bool isLoadingMoreMovies = false;

  @action
  void setIsLoadingMoreMovies(bool b) => isLoadingMoreMovies = b;

  @action
  void reset() {
    isLoadingInitialMovieList = false;
    hasErrorLoadingInitialMovieList = false;
    movieList = [];
    lastFetchedPage = null;
    totalPages = null;
    isLoadingMoreMovies = false;
  }
}
