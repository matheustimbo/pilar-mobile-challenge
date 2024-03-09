import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pilar_mobile_challenge/app/di.dart';
import 'package:pilar_mobile_challenge/app/presentation/pages/movie_search_page.dart';
import 'package:pilar_mobile_challenge/app/presentation/stores/movie_list_page_store.dart';
import 'package:pilar_mobile_challenge/app/presentation/stores/movie_search_page_store.dart';

class MovieListHomeHeaderWidget extends StatelessWidget {
  final MovieListPageStore store;

  MovieListHomeHeaderWidget({
    super.key,
    required this.store,
  });

  final searchPageStore = DI.get<MovieSearchPageStore>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: const CachedNetworkImageProvider(
            'https://www.cnnbrasil.com.br/wp-content/uploads/sites/12/2023/01/the-last-of-us-serie.jpg?w=1200&h=1200&crop=1',
          ),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Theme.of(context).colorScheme.primary.withOpacity(0.8),
            BlendMode.hardLight,
          ),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Bem-Vindo(a).',
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                ),
          ),
          Text(
            'Milhões de Filmes, Séries e Pessoas para Descobrir. Explore já.',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                ),
          ),
          const SizedBox(
            height: 40,
          ),
          Container(
            height: 46,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    onChanged: searchPageStore.setSearchQuery,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      hintText: 'Busca por um filme, série ou pessoa',
                      hintStyle:
                          Theme.of(context).textTheme.bodyLarge?.copyWith(
                                color: Colors.black.withOpacity(0.5),
                              ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Colors.black.withOpacity(0.5),
                        ),
                    cursorColor: Theme.of(context).primaryColor,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.search,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      MovieSearchPage.routeName,
                      arguments: MovieSearchPageArgs(
                        searchText: searchPageStore.searchQuery,
                      ),
                    );
                  },
                  child: Container(
                    height: 46,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      gradient: const LinearGradient(colors: [
                        Color.fromRGBO(30, 213, 169, 1),
                        Color.fromRGBO(1, 180, 228, 1)
                      ]),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 36,
                      vertical: 10,
                    ),
                    child: const Center(
                      child: Text(
                        'Buscar',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
