import 'package:flutter/material.dart';
import 'package:pilar_mobile_challenge/app/data/models/movie_list_item.dart';
import 'package:pilar_mobile_challenge/app/presentation/widgets/movie_horizontal_list_item_widget.dart';

class MovieListSectionWidget extends StatefulWidget {
  final List<MovieListItem> movies;
  final String sectionLabel;
  final VoidCallback onRetry;
  final bool isLoading;
  final bool hasError;
  final VoidCallback onReachEndOfList;
  final bool isLoadingMoreMovies;
  final VoidCallback onInit;

  const MovieListSectionWidget({
    super.key,
    required this.movies,
    required this.sectionLabel,
    required this.onRetry,
    required this.isLoading,
    required this.hasError,
    required this.onReachEndOfList,
    required this.isLoadingMoreMovies,
    required this.onInit,
  });

  @override
  State<MovieListSectionWidget> createState() => _MovieListSectionWidgetState();
}

class _MovieListSectionWidgetState extends State<MovieListSectionWidget> {
  final scrollController = ScrollController();

  void _scrollListener() {
    if (scrollController.position.extentAfter < 50) {
      widget.onReachEndOfList();
    }
  }

  @override
  void initState() {
    scrollController.addListener(_scrollListener);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.onInit();
    });
    super.initState();
  }

  @override
  void dispose() {
    scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 20),
            child: Text(
              widget.sectionLabel,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          SizedBox(
            height: 320,
            child: Builder(builder: (context) {
              if (widget.hasError) {
                return Center(
                  child: Column(
                    children: [
                      const Text(
                        'Erro ao carregar filmes',
                        style: TextStyle(color: Colors.white),
                      ),
                      const SizedBox(height: 32),
                      ElevatedButton(
                        onPressed: widget.onRetry,
                        child: const Text('Tentar novamente'),
                      ),
                    ],
                  ),
                );
              }
              if (widget.isLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Stack(
                children: [
                  ListView.separated(
                    controller: scrollController,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    separatorBuilder: (_, __) => const SizedBox(width: 20),
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.movies.length +
                        (widget.isLoadingMoreMovies ? 1 : 0),
                    itemBuilder: (context, index) {
                      if (widget.isLoadingMoreMovies &&
                          index == widget.movies.length) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      final movie = widget.movies[index];

                      return MovieHorizontalListItemWidget(movie: movie);
                    },
                  ),
                  Positioned(
                    right: 0,
                    child: IgnorePointer(
                      ignoring: true,
                      child: AnimatedBuilder(
                        animation: scrollController,
                        builder: (context, _) {
                          return AnimatedOpacity(
                            opacity: scrollController.offset > 0 ? 0 : 1,
                            curve: Curves.easeInOut,
                            duration: const Duration(milliseconds: 600),
                            child: Container(
                              width: 50,
                              height: 350,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.white.withOpacity(0),
                                    Colors.white,
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              );
            }),
          ),
        ],
      ),
    );
  }
}
