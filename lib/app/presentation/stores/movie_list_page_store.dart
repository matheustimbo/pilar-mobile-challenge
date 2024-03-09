import 'package:mobx/mobx.dart';
import 'package:pilar_mobile_challenge/app/presentation/stores/movie_list_store.dart';

part 'movie_list_page_store.g.dart';

class MovieListPageStore = _MovieListPageStoreBase with _$MovieListPageStore;

abstract class _MovieListPageStoreBase with Store {
  final popularMovies = MovieListStore();
  final topRatedMovies = MovieListStore();
  final nowPlayingMovies = MovieListStore();
}
