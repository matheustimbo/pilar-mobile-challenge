import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pilar_mobile_challenge/app/data/models/movie_details.dart';
import 'package:pilar_mobile_challenge/app/presentation/widgets/skeleton_container.dart';

class MovieDetailsInfoWidget extends StatelessWidget {
  final bool isLoadingMovieDetails;
  final bool hasErrorLoadingMovieDetails;
  final MovieDetails? movieDetails;
  final Color? moviePosterPredominantColor;
  final DateTime? movieReleaseDate;

  const MovieDetailsInfoWidget({
    super.key,
    required this.isLoadingMovieDetails,
    required this.hasErrorLoadingMovieDetails,
    required this.movieDetails,
    required this.moviePosterPredominantColor,
    required this.movieReleaseDate,
  });

  String? get movieReleaseDateLabel => movieReleaseDate == null
      ? null
      : DateFormat.yMd('pt_BR').format(movieReleaseDate!);

  String? get movieDurationLabel => movieDetails?.runtime != null
      ? '${movieDetails!.runtime ~/ 60}h ${movieDetails!.runtime % 60}m'
      : null;

  String? get genreList => (movieDetails?.genres.isNotEmpty ?? false)
      ? movieDetails!.genres.map((g) => g.name).join(', ')
      : null;

  @override
  Widget build(BuildContext context) {
    if (isLoadingMovieDetails) {
      return const SkeletonContainer(
        width: 80,
        height: 20,
        darkEnviroment: true,
      );
    }
    if (hasErrorLoadingMovieDetails || movieDetails == null) {
      //TODO error layout?
      return const SizedBox.shrink();
    }
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          color: moviePosterPredominantColor != null
              ? HSLColor.fromColor(moviePosterPredominantColor!)
                  .withLightness(
                      HSLColor.fromColor(moviePosterPredominantColor!)
                              .lightness *
                          0.3)
                  .toColor()
              : Colors.transparent,
        ),
        color: moviePosterPredominantColor != null
            ? HSLColor.fromColor(moviePosterPredominantColor!)
                .withLightness(
                    HSLColor.fromColor(moviePosterPredominantColor!).lightness *
                        0.7)
                .toColor()
            : null,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              (movieReleaseDateLabel != null
                      ? "$movieReleaseDateLabel · "
                      : "") +
                  movieDurationLabel!,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            if (genreList != null)
              Text(
                genreList!,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              )
          ],
        ),
      ),
    );
  }
}
