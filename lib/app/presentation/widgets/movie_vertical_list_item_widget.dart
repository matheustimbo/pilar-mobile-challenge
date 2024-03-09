import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pilar_mobile_challenge/app/data/models/movie_list_item.dart';
import 'package:pilar_mobile_challenge/app/presentation/pages/movie_details_page.dart';

class MovieVerticalListItemWidget extends StatelessWidget {
  final MovieListItem movie;

  const MovieVerticalListItemWidget({
    super.key,
    required this.movie,
  });

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
      child: Container(
        clipBehavior: Clip.antiAlias,
        height: 141,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              offset: const Offset(0, 2),
              blurRadius: 4,
            ),
          ],
        ),
        child: Row(
          children: [
            CachedNetworkImage(
              imageUrl:
                  'https://image.tmdb.org/t/p/w260_and_h390_bestv2${movie.poster_path}',
              width: 94,
              height: 141,
              fit: BoxFit.cover,
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.horizontal(
                    right: Radius.circular(4),
                  ),
                  border: Border.fromBorderSide(
                    BorderSide(
                      color: Colors.black12,
                      width: 1,
                    ),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      movie.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    if (movieReleaseDate != null)
                      Text(
                        movieReleaseDate!,
                        style: const TextStyle(color: Color(0xFF999999)),
                      ),
                    const SizedBox(height: 20),
                    Text(
                      movie.overview,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
