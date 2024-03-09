import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pilar_mobile_challenge/app/data/models/movie_details.dart';
import 'package:pilar_mobile_challenge/app/domain/entities/get_movie_details_use_case_params.dart';
import 'package:pilar_mobile_challenge/app/domain/repositories/movies_repository.dart';
import 'package:pilar_mobile_challenge/app/domain/usecases/get_movie_details_use_case.dart';
import 'package:pilar_mobile_challenge/shared/failures/failure.dart';

import 'get_movie_details_use_case_test.mocks.dart';

@GenerateNiceMocks([MockSpec<MoviesRepository>()])
void main() {
  late GetMovieDetailsUseCase getMovieDetailsUseCase;
  late MockMoviesRepository mockMoviesRepository;

  setUpAll(() {
    mockMoviesRepository = MockMoviesRepository();
    getMovieDetailsUseCase = GetMovieDetailsUseCase(mockMoviesRepository);
  });

  final exampleMovieDetailsResponse = MovieDetails(
    id: 1,
    genres: [],
    runtime: 120,
    tagline: '',
    title: 'Title 1',
    adult: false,
    vote_average: 10,
    poster_path: '',
    release_date: DateTime.now(),
    overview: '',
    backdrop_path: '',
  );

  group('GetMovieDetailsUseCase', () {
    test('should get movie details from repository', () async {
      when(mockMoviesRepository.getMovieDetails(any, any))
          .thenAnswer((_) async => Right(exampleMovieDetailsResponse));

      final result = await getMovieDetailsUseCase(
          GetMovieDetailsUseCaseParams(movieId: 1, language: 'pt-BR'));

      expect(result, equals(Right(exampleMovieDetailsResponse)));
      verify(mockMoviesRepository.getMovieDetails(1, 'pt-BR'));
      verifyNoMoreInteractions(mockMoviesRepository);
    });

    test('should return failure if repository throws exception', () async {
      when(mockMoviesRepository.getMovieDetails(any, any))
          .thenAnswer((_) async => Left(Failure()));

      final result = await getMovieDetailsUseCase(
          GetMovieDetailsUseCaseParams(movieId: 1, language: 'pt-BR'));

      expect(result, equals(Left(Failure())));
      verify(mockMoviesRepository.getMovieDetails(1, 'pt-BR'));
      verifyNoMoreInteractions(mockMoviesRepository);
    });
  });
}
