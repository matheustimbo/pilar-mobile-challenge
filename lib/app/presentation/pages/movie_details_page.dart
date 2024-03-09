import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
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
  final MovieListItem movie;

  const MovieDetailsPageArgs({required this.movie});
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

  @override
  void initState() {
    controller.initialize(posterPathUrl, movie.id);
    super.initState();
  }

  String get posterPathUrl =>
      '${Constants.moviePosterPathw220h330BaseUrl}${movie.poster_path}';

  String get backdropPathUrl =>
      '${Constants.movieBackdropPathw1000h450BaseUrl}${movie.backdrop_path}';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
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
                        backdropPathUrl: backdropPathUrl,
                        posterPathUrl: posterPathUrl,
                        moviePosterPredominantColor:
                            store.moviePosterPredominantColor,
                      );
                    }),
                    MovieDetailsTitleWidget(movie: movie),
                    MovieDetailsReviewWidget(movie: movie),
                    Observer(builder: (context) {
                      return MovieDetailsInfoWidget(
                        isLoadingMovieDetails: store.isLoadingMovieDetails,
                        hasErrorLoadingMovieDetails:
                            store.hasErrorLoadingMovieDetails,
                        movieDetails: store.movieDetails,
                        moviePosterPredominantColor:
                            store.moviePosterPredominantColor,
                        movieReleaseDate: movie.release_date,
                      );
                    }),
                    Observer(builder: (context) {
                      return MovieDetailsOverviewWidget(
                        movie: movie,
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
                hasErrorLoadingMovieCredits: store.hasErrorLoadingMovieCredits,
                movieCredits: store.movieCredits,
                retryLoadingMovieCredits: () =>
                    controller.fetchMovieCredits(movie.id),
              );
            }),
          ),
        ],
      ),
    );
  }
}
