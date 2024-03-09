import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pilar_mobile_challenge/app/data/models/movie_list_item.dart';
import 'package:pilar_mobile_challenge/app/presentation/pages/movie_details_page.dart';
import 'package:pilar_mobile_challenge/app/presentation/widgets/movie_vote_indicator_widget.dart';

class MovieHorizontalListItemWidget extends StatelessWidget {
  final MovieListItem movie;

  const MovieHorizontalListItemWidget({super.key, required this.movie});

  String? get movieReleaseDate => movie.release_date == null
      ? null
      : DateFormat.yMd('pt_BR').format(movie.release_date!);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(
        MovieDetailsPage.routeName,
        arguments: MovieDetailsPageArgs(movie: movie),
      ),
      child: SizedBox(
        width: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 150,
              height: 225,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: CachedNetworkImage(
                      imageUrl:
                          'https://image.tmdb.org/t/p/w500${movie.poster_path}',
                      width: 150,
                      height: 225,
                      fit: BoxFit.cover,
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                  Positioned(
                    left: 10,
                    bottom: -19,
                    child: MovieVoteIndicatorWidget.small(
                      voteAverage: movie.vote_average,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 26),
              child: Text(
                movie.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w800,
                  fontSize: 16,
                ),
              ),
            ),
            if (movieReleaseDate != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(movieReleaseDate!),
              )
          ],
        ),
      ),
    );
  }
}
