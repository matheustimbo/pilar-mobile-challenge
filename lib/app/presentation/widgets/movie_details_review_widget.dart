import 'package:flutter/material.dart';
import 'package:pilar_mobile_challenge/app/presentation/widgets/movie_vote_indicator_widget.dart';

class MovieDetailsReviewWidget extends StatelessWidget {
  final double movieVoteAverage;

  const MovieDetailsReviewWidget({
    super.key,
    required this.movieVoteAverage,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        bottom: 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MovieVoteIndicatorWidget.medium(
            voteAverage: movieVoteAverage,
          ),
          const SizedBox(width: 8),
          const Text(
            'Avaliação dos usuários',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
