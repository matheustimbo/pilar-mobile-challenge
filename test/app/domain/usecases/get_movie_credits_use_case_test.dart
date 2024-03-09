import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pilar_mobile_challenge/app/data/models/movie_credits.dart';
import 'package:pilar_mobile_challenge/app/domain/entities/get_movie_credits_use_case_params.dart';
import 'package:pilar_mobile_challenge/app/domain/repositories/movies_repository.dart';
import 'package:pilar_mobile_challenge/app/domain/usecases/get_movie_credits_use_case.dart';
import 'package:pilar_mobile_challenge/shared/failures/failure.dart';

import 'get_movie_credits_use_case_test.mocks.dart';

@GenerateNiceMocks([MockSpec<MoviesRepository>()])
void main() {
  late GetMovieCreditsUseCase getMovieCreditsUseCase;
  late MockMoviesRepository mockMoviesRepository;

  setUpAll(() {
    mockMoviesRepository = MockMoviesRepository();
    getMovieCreditsUseCase = GetMovieCreditsUseCase(mockMoviesRepository);
  });

  final exampleMovieCreditsResponse = MovieCredits(id: 1, cast: []);

  group('GetMovieCreditsUseCase', () {
    test('should get movie credits from repository', () async {
      when(mockMoviesRepository.getMovieCredits(any, any))
          .thenAnswer((_) async => Right(exampleMovieCreditsResponse));

      final result = await getMovieCreditsUseCase(
          GetMovieCreditsUseCaseParams(movieId: 1, language: 'pt-BR'));

      expect(result, equals(Right(exampleMovieCreditsResponse)));
      verify(mockMoviesRepository.getMovieCredits(1, 'pt-BR'));
      verifyNoMoreInteractions(mockMoviesRepository);
    });

    test('should return failure if repository throws exception', () async {
      when(mockMoviesRepository.getMovieCredits(any, any))
          .thenAnswer((_) async => Left(Failure()));

      final result = await getMovieCreditsUseCase(
          GetMovieCreditsUseCaseParams(movieId: 1, language: 'pt-BR'));

      expect(result, equals(Left(Failure())));
      verify(mockMoviesRepository.getMovieCredits(1, 'pt-BR'));
      verifyNoMoreInteractions(mockMoviesRepository);
    });
  });
}
