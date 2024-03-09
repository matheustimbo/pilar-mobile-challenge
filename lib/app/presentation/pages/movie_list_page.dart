import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pilar_mobile_challenge/app/presentation/controllers/movie_list_page_controller.dart';
import 'package:pilar_mobile_challenge/app/presentation/stores/movie_list_page_store.dart';
import 'package:pilar_mobile_challenge/app/presentation/widgets/app_bar_widget.dart';
import 'package:pilar_mobile_challenge/app/presentation/widgets/movie_list_home_header_widget.dart';
import 'package:pilar_mobile_challenge/app/presentation/widgets/movie_list_section_widget.dart';

class MovieListPage extends StatefulWidget {
  static const routeName = 'movie_list_page';

  const MovieListPage({super.key});

  @override
  State<MovieListPage> createState() => _MovieListPageState();
}

class _MovieListPageState extends State<MovieListPage> {
  final store = MovieListPageStore();
  late final controller = MovieListPageController(store: store);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const AppBarWidget(),
          SliverToBoxAdapter(
            child: _DesktopMaxWidthWrapper(
              child: MovieListHomeHeaderWidget(
                store: store,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: _DesktopMaxWidthWrapper(
              child: Observer(builder: (context) {
                return MovieListSectionWidget(
                  movies: store.nowPlayingMovies.movieList,
                  sectionLabel: 'Em cartaz',
                  hasError:
                      store.nowPlayingMovies.hasErrorLoadingInitialMovieList,
                  isLoading: store.nowPlayingMovies.isLoadingInitialMovieList,
                  onRetry: controller.fetchInitialNowPlayingMoviesList,
                  onReachEndOfList: controller.fetchMoreNowPlayingMovies,
                  isLoadingMoreMovies:
                      store.nowPlayingMovies.isLoadingMoreMovies,
                  onInit: controller.fetchInitialNowPlayingMoviesList,
                );
              }),
            ),
          ),
          SliverToBoxAdapter(
            child: _DesktopMaxWidthWrapper(
              child: Observer(builder: (context) {
                return MovieListSectionWidget(
                  movies: store.popularMovies.movieList,
                  sectionLabel: 'Populares',
                  hasError: store.popularMovies.hasErrorLoadingInitialMovieList,
                  isLoading: store.popularMovies.isLoadingInitialMovieList,
                  onRetry: controller.fetchInitialPopularMoviesList,
                  onReachEndOfList: controller.fetchMorePopularMovies,
                  isLoadingMoreMovies: store.popularMovies.isLoadingMoreMovies,
                  onInit: controller.fetchInitialPopularMoviesList,
                );
              }),
            ),
          ),
          SliverToBoxAdapter(
            child: _DesktopMaxWidthWrapper(
              child: Observer(builder: (context) {
                return MovieListSectionWidget(
                  movies: store.topRatedMovies.movieList,
                  sectionLabel: 'Melhor avaliados',
                  hasError:
                      store.topRatedMovies.hasErrorLoadingInitialMovieList,
                  isLoading: store.topRatedMovies.isLoadingInitialMovieList,
                  onRetry: controller.fetchInitialTopRatedMoviesList,
                  onReachEndOfList: controller.fetchMoreTopRatedMovies,
                  isLoadingMoreMovies: store.topRatedMovies.isLoadingMoreMovies,
                  onInit: controller.fetchInitialTopRatedMoviesList,
                );
              }),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: MediaQuery.of(context).padding.bottom),
          ),
        ],
      ),
    );
  }
}

class _DesktopMaxWidthWrapper extends StatelessWidget {
  final Widget child;

  const _DesktopMaxWidthWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 1300),
        child: child,
      ),
    );
  }
}
