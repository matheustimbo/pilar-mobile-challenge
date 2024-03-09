import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:pilar_mobile_challenge/app/presentation/controllers/movie_search_page_controller.dart';
import 'package:pilar_mobile_challenge/app/presentation/stores/movie_search_page_store.dart';
import 'package:pilar_mobile_challenge/app/presentation/widgets/app_bar_widget.dart';
import 'package:pilar_mobile_challenge/app/presentation/widgets/desktop_max_width_wrapper.dart';
import 'package:pilar_mobile_challenge/app/presentation/widgets/movie_vertical_list_item_widget.dart';

class MovieSearchPageArgs {
  final String searchText;

  const MovieSearchPageArgs({required this.searchText});
}

class MovieSearchPage extends StatefulWidget {
  final MovieSearchPageArgs args;

  const MovieSearchPage({
    super.key,
    required this.args,
  });

  static const routeName = 'movie_search_page';

  @override
  State<MovieSearchPage> createState() => _MovieSearchPageState();
}

class _MovieSearchPageState extends State<MovieSearchPage> {
  final store = MovieSearchPageStore();
  late final controller = MovieSearchPageController(store: store);
  late ReactionDisposer searchQueryReactionDisposer;
  final scrollController = ScrollController();

  @override
  void initState() {
    scrollController.addListener(_scrollListener);
    store.searchQuery = widget.args.searchText;
    controller.searchInitialMovieList(widget.args.searchText);
    searchQueryReactionDisposer = reaction(
      (_) => [store.searchQuery],
      (_) {
        searchByNewQuery();
      },
      delay: 500,
    );
    super.initState();
  }

  void searchByNewQuery() {
    store.searchMovies.reset();
    controller.searchInitialMovieList(store.searchQuery);
  }

  void _scrollListener() {
    if (scrollController.position.extentAfter < 50) {
      controller.searchMoreMovies(store.searchQuery);
    }
  }

  @override
  void dispose() {
    scrollController.removeListener(_scrollListener);
    searchQueryReactionDisposer.reaction.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          const AppBarWidget(),
          SliverAppBar(
            primary: false,
            pinned: true,
            automaticallyImplyLeading: false,
            title: TextFormField(
              onChanged: store.setSearchQuery,
              initialValue: widget.args.searchText,
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                hintText: 'Busca por um filme, série ou pessoa',
                hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.black.withOpacity(0.5),
                    ),
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.zero),
              ),
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.black.withOpacity(0.5),
                  ),
              cursorColor: Theme.of(context).primaryColor,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.search,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              color: const Color.fromRGBO(1, 180, 228, 1),
              child: const Text(
                'Resultado da Busca',
                style: TextStyle(
                  fontSize: 19,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          Observer(builder: (context) {
            if (store.searchMovies.isLoadingInitialMovieList) {
              return const SliverFillRemaining(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
            if (store.searchMovies.hasErrorLoadingInitialMovieList) {
              return SliverFillRemaining(
                  child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Erro ao carregar filmes',
                      style: TextStyle(color: Colors.black),
                    ),
                    const SizedBox(height: 32),
                    ElevatedButton(
                      onPressed: () =>
                          controller.searchInitialMovieList(store.searchQuery),
                      child: const Text('Tentar novamente'),
                    ),
                  ],
                ),
              ));
            }
            return SliverPadding(
              padding: const EdgeInsets.all(20),
              sliver: SliverList.separated(
                itemBuilder: (context, index) => DesktopMaxWidthWrapper(
                  child: MovieVerticalListItemWidget(
                    movie: store.searchMovies.movieList[index],
                  ),
                ),
                separatorBuilder: (_, __) => const SizedBox(height: 20),
                itemCount: store.searchMovies.movieList.length,
              ),
            );
          }),
        ],
      ),
    );
  }
}
