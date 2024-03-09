import 'package:flutter/material.dart';

class MovieDetailsTitleWidget extends StatelessWidget {
  // final MovieListItem movie;
  final String movieTitle;
  final DateTime? movieReleaseDate;

  const MovieDetailsTitleWidget({
    super.key,
    required this.movieTitle,
    required this.movieReleaseDate,
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
              text: movieTitle,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (movieReleaseDate != null)
              TextSpan(
                text: ' (${movieReleaseDate!.year})',
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
