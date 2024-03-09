import 'package:flutter/material.dart';
import 'package:pilar_mobile_challenge/app/data/models/movie_list_item.dart';
import 'package:pilar_mobile_challenge/app/presentation/widgets/movie_vote_indicator_widget.dart';

class MovieDetailsReviewWidget extends StatelessWidget {
  final MovieListItem movie;

  const MovieDetailsReviewWidget({
    super.key,
    required this.movie,
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
            voteAverage: movie.vote_average,
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
