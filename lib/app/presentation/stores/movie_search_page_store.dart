import 'package:mobx/mobx.dart';
import 'package:pilar_mobile_challenge/app/presentation/stores/movie_list_store.dart';

part 'movie_search_page_store.g.dart';

class MovieSearchPageStore = _MovieSearchPageStoreBase
    with _$MovieSearchPageStore;

abstract class _MovieSearchPageStoreBase with Store {
  @observable
  String searchQuery = '';

  @action
  void setSearchQuery(String value) => searchQuery = value;

  final searchMovies = MovieListStore();
}
