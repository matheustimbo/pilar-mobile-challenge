import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pilar_mobile_challenge/app/data/models/movies_list_response.dart';
import 'package:pilar_mobile_challenge/app/domain/entities/search_movie_by_title_use_case_params.dart';
import 'package:pilar_mobile_challenge/app/domain/repositories/movies_repository.dart';
import 'package:pilar_mobile_challenge/app/domain/usecases/search_movie_by_title_use_case.dart';
import 'package:pilar_mobile_challenge/shared/failures/failure.dart';

import 'search_movie_by_title_use_case_test.mocks.dart';

@GenerateNiceMocks([MockSpec<MoviesRepository>()])
void main() {
  late MockMoviesRepository mockMoviesRepository;
  late SearchMovieByTitleUseCase searchMoviesByTitleListUseCase;

  setUpAll(() {
    mockMoviesRepository = MockMoviesRepository();
    searchMoviesByTitleListUseCase =
        SearchMovieByTitleUseCase(mockMoviesRepository);
  });

  final exampleResponse = MoviesListResponse(
    page: 1,
    results: [],
    total_pages: 10,
    total_results: 100,
  );

  group('SearchMovieByTitleUseCase', () {
    test(
        'should get list of now playing movies on specified page and language from repository',
        () async {
      when(mockMoviesRepository.searchMoviesByTitle(any, any, any))
          .thenAnswer((_) async => Right(exampleResponse));

      final result = await searchMoviesByTitleListUseCase(
        SearchMovieByTitleUseCaseParams(
          page: 1,
          language: 'en-US',
          query: 'query',
        ),
      );

      expect(result, equals(Right(exampleResponse)));
      verify(mockMoviesRepository.searchMoviesByTitle('query', 1, 'en-US'));
      verifyNoMoreInteractions(mockMoviesRepository);
    });

    test('should return a Failure when repository fails', () async {
      when(mockMoviesRepository.searchMoviesByTitle(any, any, any))
          .thenAnswer((_) async => Left(Failure()));

      final result = await searchMoviesByTitleListUseCase(
        SearchMovieByTitleUseCaseParams(
          page: 1,
          language: 'en-US',
          query: 'query',
        ),
      );

      expect(result, equals(Left(Failure())));
      verify(mockMoviesRepository.searchMoviesByTitle('query', 1, 'en-US'));
      verifyNoMoreInteractions(mockMoviesRepository);
    });
  });
}
