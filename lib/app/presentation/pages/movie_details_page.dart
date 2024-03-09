import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:pilar_mobile_challenge/app/data/models/movie_list_item.dart';
import 'package:pilar_mobile_challenge/app/presentation/controllers/movie_details_page_controller.dart';
import 'package:pilar_mobile_challenge/app/presentation/stores/movie_details_page_store.dart';
import 'package:pilar_mobile_challenge/app/presentation/widgets/app_bar_widget.dart';
import 'package:pilar_mobile_challenge/app/presentation/widgets/movie_details_banner_widget.dart';
import 'package:pilar_mobile_challenge/app/presentation/widgets/movie_details_cast_widget.dart';
import 'package:pilar_mobile_challenge/app/presentation/widgets/movie_details_info_widget.dart';
import 'package:pilar_mobile_challenge/app/presentation/widgets/movie_details_overview_widget.dart';
import 'package:pilar_mobile_challenge/app/presentation/widgets/movie_details_review_widget.dart';
import 'package:pilar_mobile_challenge/app/presentation/widgets/movie_details_title_widget.dart';
import 'package:pilar_mobile_challenge/shared/utils/constants.dart';

class MovieDetailsPageArgs {
  final MovieListItem? movie;
  final int movieId;

  const MovieDetailsPageArgs({
    this.movie,
    required this.movieId,
  });
}

class MovieDetailsPage extends StatefulWidget {
  final MovieDetailsPageArgs args;

  static const routeName = 'movie_details_page';

  const MovieDetailsPage({
    super.key,
    required this.args,
  });

  @override
  State<MovieDetailsPage> createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  final store = MovieDetailsPageStore();
  late final controller = MovieDetailsPageController(store: store);
  late final movie = widget.args.movie;
  late final movieId = widget.args.movieId;
  late ReactionDisposer _reactionDisposer;

  @override
  void initState() {
    controller.initialize(movieId);

    _reactionDisposer =
        when((_) => movie != null || store.movieDetails != null, () {
      controller.fetchPosterPathImagePredominantColor(posterPathUrl!);
    });
    super.initState();
  }

  @override
  void dispose() {
    _reactionDisposer();
    super.dispose();
  }

  String? get posterPathUrl {
    if (movie != null) {
      return '${Constants.moviePosterPathw220h330BaseUrl}${movie!.poster_path}';
    }
    if (store.movieDetails != null) {
      return '${Constants.moviePosterPathw220h330BaseUrl}${store.movieDetails!.poster_path}';
    }
    return null;
  }

  String? get backdropPathUrl {
    if (movie != null) {
      return '${Constants.movieBackdropPathw1000h450BaseUrl}${movie!.backdrop_path}';
    }
    if (store.movieDetails != null) {
      return '${Constants.movieBackdropPathw1000h450BaseUrl}${store.movieDetails!.backdrop_path}';
    }
    return null;
  }

  String? get movieTitle => store.movieDetails?.title ?? movie?.title;

  DateTime? get movieReleaseDate =>
      store.movieDetails?.release_date ?? movie?.release_date;

  String? get movieOverview => store.movieDetails?.overview ?? movie?.overview;

  double? get movieVoteAverage =>
      store.movieDetails?.vote_average ?? movie?.vote_average;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(builder: (context) {
        if (movie == null) {
          if (store.hasErrorLoadingMovieDetails) {
            return Center(
              child: Column(
                children: [
                  const Text('Erro ao carregar informações do filme'),
                  ElevatedButton(
                    onPressed: () {
                      controller.fetchMovieDetails(movieId);
                    },
                    child: const Text('Tentar novamente'),
                  ),
                ],
              ),
            );
          }

          if (store.isLoadingMovieDetails) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }
        return CustomScrollView(
          slivers: [
            const AppBarWidget(),
            SliverToBoxAdapter(
              child: Observer(builder: (context) {
                return Container(
                  color: store.moviePosterPredominantColor ?? Colors.black,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Observer(builder: (context) {
                        return MovieDetailsBannerWidget(
                          backdropPathUrl: backdropPathUrl!,
                          posterPathUrl: posterPathUrl!,
                          moviePosterPredominantColor:
                              store.moviePosterPredominantColor,
                        );
                      }),
                      MovieDetailsTitleWidget(
                        movieTitle: movieTitle!,
                        movieReleaseDate: movieReleaseDate,
                      ),
                      MovieDetailsReviewWidget(
                        movieVoteAverage: movieVoteAverage!,
                      ),
                      Observer(builder: (context) {
                        return MovieDetailsInfoWidget(
                          isLoadingMovieDetails: store.isLoadingMovieDetails,
                          hasErrorLoadingMovieDetails:
                              store.hasErrorLoadingMovieDetails,
                          movieDetails: store.movieDetails,
                          moviePosterPredominantColor:
                              store.moviePosterPredominantColor,
                          movieReleaseDate: movieReleaseDate,
                        );
                      }),
                      Observer(builder: (context) {
                        return MovieDetailsOverviewWidget(
                          movieOverview: movieOverview!,
                          isLoadingMovieDetails: store.isLoadingMovieDetails,
                          hasErrorLoadingMovieDetails:
                              store.hasErrorLoadingMovieDetails,
                          movieDetails: store.movieDetails,
                        );
                      }),
                    ],
                  ),
                );
              }),
            ),
            SliverToBoxAdapter(
              child: Observer(builder: (context) {
                return MovieDetailsCastWidget(
                  isLoadingMovieCredits: store.isLoadingMovieCredits,
                  hasErrorLoadingMovieCredits:
                      store.hasErrorLoadingMovieCredits,
                  movieCredits: store.movieCredits,
                  retryLoadingMovieCredits: () =>
                      controller.fetchMovieCredits(movieId),
                );
              }),
            ),
          ],
        );
      }),
    );
  }
}
