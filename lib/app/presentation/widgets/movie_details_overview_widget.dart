import 'package:flutter/material.dart';
import 'package:pilar_mobile_challenge/app/data/models/movie_details.dart';
import 'package:pilar_mobile_challenge/app/data/models/movie_list_item.dart';
import 'package:pilar_mobile_challenge/app/presentation/widgets/skeleton_container.dart';

class MovieDetailsOverviewWidget extends StatelessWidget {
  final MovieListItem movie;
  final bool isLoadingMovieDetails;
  final bool hasErrorLoadingMovieDetails;
  final MovieDetails? movieDetails;

  const MovieDetailsOverviewWidget({
    super.key,
    required this.movie,
    required this.isLoadingMovieDetails,
    required this.hasErrorLoadingMovieDetails,
    this.movieDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Builder(builder: (context) {
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
            return Text(
              movieDetails!.tagline,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w400,
              ),
            );
          }),
          const Padding(
            padding: EdgeInsets.only(
              bottom: 8,
              top: 10,
            ),
            child: Text(
              'Sinopse',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: Text(
              movie.overview,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
