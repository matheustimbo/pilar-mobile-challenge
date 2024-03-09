import 'package:flutter/material.dart';
import 'package:pilar_mobile_challenge/app/data/models/movie_credits.dart';
import 'package:pilar_mobile_challenge/app/presentation/widgets/movie_cast_list_item.dart';

class MovieDetailsCastWidget extends StatelessWidget {
  final bool isLoadingMovieCredits;
  final bool hasErrorLoadingMovieCredits;
  final MovieCredits? movieCredits;
  final VoidCallback retryLoadingMovieCredits;

  const MovieDetailsCastWidget({
    super.key,
    required this.isLoadingMovieCredits,
    required this.hasErrorLoadingMovieCredits,
    required this.movieCredits,
    required this.retryLoadingMovieCredits,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Builder(
        builder: (context) {
          if (isLoadingMovieCredits) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (hasErrorLoadingMovieCredits || movieCredits == null) {
            return Center(
              child: Column(
                children: [
                  const Text(
                    'Erro ao carregar elenco principal',
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(height: 32),
                  ElevatedButton(
                    onPressed: retryLoadingMovieCredits,
                    child: const Text('Tentar novamente'),
                  ),
                ],
              ),
            );
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Elenco principal',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 259,
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (ctx, i) => MovieCastListItem(
                    person: movieCredits!.cast[i],
                  ),
                  itemCount: movieCredits!.cast.length,
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
