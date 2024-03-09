import 'package:flutter/material.dart';
import 'package:pilar_mobile_challenge/app/data/models/movie_list_item.dart';

class MovieDetailsTitleWidget extends StatelessWidget {
  final MovieListItem movie;

  const MovieDetailsTitleWidget({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 20,
      ),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: movie.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (movie.release_date != null)
              TextSpan(
                text: ' (${movie.release_date!.year})',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
