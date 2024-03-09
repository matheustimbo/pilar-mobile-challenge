import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pilar_mobile_challenge/app/data/models/movies_list_response.dart';
import 'package:pilar_mobile_challenge/app/domain/entities/get_movies_list_use_case_params.dart';
import 'package:pilar_mobile_challenge/app/domain/repositories/movies_repository.dart';
import 'package:pilar_mobile_challenge/app/domain/usecases/get_popular_movies_list_use_case.dart';
import 'package:pilar_mobile_challenge/shared/failures/failure.dart';

import 'get_popular_movies_list_use_case_test.mocks.dart';

@GenerateNiceMocks([MockSpec<MoviesRepository>()])
void main() {
  late MockMoviesRepository mockMoviesRepository;
  late GetPopularMoviesListUseCase getPopularMoviesListUseCase;

  setUpAll(() {
    mockMoviesRepository = MockMoviesRepository();
    getPopularMoviesListUseCase =
        GetPopularMoviesListUseCase(mockMoviesRepository);
  });

  final exampleResponse = MoviesListResponse(
    page: 1,
    results: [],
    total_pages: 10,
    total_results: 100,
  );

  group('GetPopularMoviesListUseCase', () {
    test(
        'should get list of popular movies on specified page and language from repository',
        () async {
      when(mockMoviesRepository.getPopularMovies(any, any))
          .thenAnswer((_) async => Right(exampleResponse));

      final result = await getPopularMoviesListUseCase(
          GetMoviesListUseCaseParams(page: 1, language: 'en-US'));

      expect(result, equals(Right(exampleResponse)));
      verify(mockMoviesRepository.getPopularMovies(1, 'en-US'));
      verifyNoMoreInteractions(mockMoviesRepository);
    });

    test('should return a Failure when repository fails', () async {
      when(mockMoviesRepository.getPopularMovies(any, any))
          .thenAnswer((_) async => Left(Failure()));

      final result = await getPopularMoviesListUseCase(
          GetMoviesListUseCaseParams(page: 1, language: 'en-US'));

      expect(result, equals(Left(Failure())));
      verify(mockMoviesRepository.getPopularMovies(1, 'en-US'));
      verifyNoMoreInteractions(mockMoviesRepository);
    });
  });
}
