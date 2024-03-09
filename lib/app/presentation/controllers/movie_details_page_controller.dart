import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:pilar_mobile_challenge/app/di.dart';
import 'package:pilar_mobile_challenge/app/domain/entities/get_movie_credits_use_case_params.dart';
import 'package:pilar_mobile_challenge/app/domain/entities/get_movie_details_use_case_params.dart';
import 'package:pilar_mobile_challenge/app/domain/usecases/get_movie_credits_use_case.dart';
import 'package:pilar_mobile_challenge/app/domain/usecases/get_movie_details_use_case.dart';
import 'package:pilar_mobile_challenge/app/presentation/stores/movie_details_page_store.dart';

class MovieDetailsPageController {
  final MovieDetailsPageStore store;

  MovieDetailsPageController({
    required this.store,
  });

  final _getMovieDetailsUseCase = DI.get<GetMovieDetailsUseCase>();
  final _getMovieCreditsUseCase = DI.get<GetMovieCreditsUseCase>();

  void initialize(
    String posterPathUrl,
    int movieId,
  ) {
    fetchPosterPathImagePredominantColor(posterPathUrl);
    fetchMovieDetails(movieId);
    fetchMovieCredits(movieId);
  }

  Future<void> fetchPosterPathImagePredominantColor(
    String posterPathUrl,
  ) async {
    final provider = CachedNetworkImageProvider(posterPathUrl);

    final pallete = await PaletteGenerator.fromImageProvider(
      provider,
    );

    final dominantColor = pallete.dominantColor?.color;

    if (dominantColor != null) {
      final hslColor = HSLColor.fromColor(dominantColor);
      store.setMoviePredominantColor(
          hslColor.withLightness(hslColor.lightness * 0.8).toColor());
    }
  }

  Future<void> fetchMovieDetails(int movieId) async {
    if (store.isLoadingMovieDetails) return;
    store.setIsLoadingMovieDetails(true);
    store.setHasErrorLoadingMovieDetails(false);
    final result = await _getMovieDetailsUseCase(
      GetMovieDetailsUseCaseParams(
        movieId: movieId,
        language: 'pt-BR',
      ),
    );
    result.fold((l) {
      store.setHasErrorLoadingMovieDetails(true);
    }, (movieDetails) {
      store.setMovieDetails(movieDetails);
    });
    store.setIsLoadingMovieDetails(false);
  }

  Future<void> fetchMovieCredits(int movieId) async {
    if (store.isLoadingMovieCredits) return;
    store.setIsLoadingMovieCredits(true);
    store.setHasErrorLoadingMovieCredits(false);
    final result = await _getMovieCreditsUseCase(
      GetMovieCreditsUseCaseParams(
        movieId: movieId,
        language: 'pt-BR',
      ),
    );
    result.fold((l) {
      store.setHasErrorLoadingMovieCredits(true);
    }, (movieCredits) {
      store.setMovieCredits(movieCredits);
    });
    store.setIsLoadingMovieCredits(false);
  }
}
