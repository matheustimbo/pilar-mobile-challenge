import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pilar_mobile_challenge/app/data/models/movie_list_item.dart';
import 'package:pilar_mobile_challenge/app/data/models/movies_list_response.dart';
import 'package:pilar_mobile_challenge/app/domain/usecases/get_not_playing_movies_list_use_case.dart';
import 'package:pilar_mobile_challenge/app/domain/usecases/get_popular_movies_list_use_case.dart';
import 'package:pilar_mobile_challenge/app/domain/usecases/get_top_rated_movies_list_use_case.dart';
import 'package:pilar_mobile_challenge/app/presentation/controllers/movie_list_page_controller.dart';
import 'package:pilar_mobile_challenge/app/presentation/stores/movie_list_page_store.dart';
import 'package:pilar_mobile_challenge/shared/failures/failure.dart';

import 'movie_list_page_controller_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<GetPopularMoviesListUseCase>(),
  MockSpec<GetTopRatedMoviesListUseCase>(),
  MockSpec<GetNowPlayingMoviesListUseCase>()
])
void main() {
  late MovieListPageController movieListPageController;
  late MovieListPageStore movieListPageStore;
  late MockGetNowPlayingMoviesListUseCase getNowPlayingMoviesListUseCase;
  late MockGetPopularMoviesListUseCase getPopularMoviesListUseCase;
  late MockGetTopRatedMoviesListUseCase getTopRatedMoviesListUseCase;

  setUp(() {
    GetIt.instance.reset();
    getNowPlayingMoviesListUseCase = MockGetNowPlayingMoviesListUseCase();
    getPopularMoviesListUseCase = MockGetPopularMoviesListUseCase();
    getTopRatedMoviesListUseCase = MockGetTopRatedMoviesListUseCase();
    GetIt.instance.registerLazySingleton<GetNowPlayingMoviesListUseCase>(
        () => getNowPlayingMoviesListUseCase);
    GetIt.instance.registerLazySingleton<GetPopularMoviesListUseCase>(
        () => getPopularMoviesListUseCase);
    GetIt.instance.registerLazySingleton<GetTopRatedMoviesListUseCase>(
        () => getTopRatedMoviesListUseCase);
    movieListPageStore = MovieListPageStore();
    movieListPageController =
        MovieListPageController(store: movieListPageStore);
  });

  final exampleResponse = MoviesListResponse(
    page: 1,
    results: [
      MovieListItem(
          adult: true,
          id: 1,
          title: '1',
          vote_average: 10,
          poster_path: '',
          release_date: DateTime.now(),
          overview: '',
          backdrop_path: '')
    ],
    total_pages: 10,
    total_results: 100,
  );

  group('MovieListPageController', () {
    group('fetchInitialPopularMovieList', () {
      test(
          'should handle state correctly when getPopularMoviesUsecase returns successfully',
          () async {
        when(getPopularMoviesListUseCase.call(any))
            .thenAnswer((_) async => Right(exampleResponse));

        final future = movieListPageController.fetchInitialPopularMoviesList();

        verify(getPopularMoviesListUseCase.call(any));
        verifyNoMoreInteractions(getPopularMoviesListUseCase);
        expect(
          movieListPageStore.popularMovies.isLoadingInitialMovieList,
          true,
        );
        expect(
          movieListPageStore.popularMovies.hasErrorLoadingInitialMovieList,
          false,
        );

        await future;

        expect(
          movieListPageStore.popularMovies.isLoadingInitialMovieList,
          false,
        );
        expect(
          movieListPageStore.popularMovies.hasErrorLoadingInitialMovieList,
          false,
        );
        expect(
          movieListPageStore.popularMovies.movieList,
          exampleResponse.results,
        );
      });

      test('should handle state correctly when getPopularMoviesUsecase fails',
          () async {
        when(getPopularMoviesListUseCase.call(any))
            .thenAnswer((_) async => Left(Failure()));

        final future = movieListPageController.fetchInitialPopularMoviesList();

        verify(getPopularMoviesListUseCase.call(any));
        verifyNoMoreInteractions(getPopularMoviesListUseCase);
        expect(
          movieListPageStore.popularMovies.isLoadingInitialMovieList,
          true,
        );
        expect(
          movieListPageStore.popularMovies.hasErrorLoadingInitialMovieList,
          false,
        );

        await future;

        expect(
          movieListPageStore.popularMovies.isLoadingInitialMovieList,
          false,
        );
        expect(
          movieListPageStore.popularMovies.hasErrorLoadingInitialMovieList,
          true,
        );
        expect(
          movieListPageStore.popularMovies.movieList,
          [],
        );
      });

      test('should not do anything if its already loading', () {
        movieListPageStore.popularMovies.setIsLoadingInitialMovieList(true);

        movieListPageController.fetchInitialPopularMoviesList();

        verifyZeroInteractions(getPopularMoviesListUseCase);
      });
    });

    group('fetchInitialTopRatedMoviesList', () {
      test(
          'should handle state correctly when getTopRatedMoviesUsecase returns successfully',
          () async {
        when(getTopRatedMoviesListUseCase.call(any))
            .thenAnswer((_) async => Right(exampleResponse));

        final future = movieListPageController.fetchInitialTopRatedMoviesList();

        verify(getTopRatedMoviesListUseCase.call(any));
        verifyNoMoreInteractions(getTopRatedMoviesListUseCase);
        expect(
          movieListPageStore.topRatedMovies.isLoadingInitialMovieList,
          true,
        );
        expect(
          movieListPageStore.topRatedMovies.hasErrorLoadingInitialMovieList,
          false,
        );

        await future;

        expect(
          movieListPageStore.topRatedMovies.isLoadingInitialMovieList,
          false,
        );
        expect(
          movieListPageStore.topRatedMovies.hasErrorLoadingInitialMovieList,
          false,
        );
        expect(
          movieListPageStore.topRatedMovies.movieList,
          exampleResponse.results,
        );
      });

      test('should handle state correctly when getTopRatedMoviesUsecase fails',
          () async {
        when(getTopRatedMoviesListUseCase.call(any))
            .thenAnswer((_) async => Left(Failure()));

        final future = movieListPageController.fetchInitialTopRatedMoviesList();

        verify(getTopRatedMoviesListUseCase.call(any));
        verifyNoMoreInteractions(getTopRatedMoviesListUseCase);
        expect(
          movieListPageStore.topRatedMovies.isLoadingInitialMovieList,
          true,
        );
        expect(
          movieListPageStore.topRatedMovies.hasErrorLoadingInitialMovieList,
          false,
        );

        await future;

        expect(
          movieListPageStore.topRatedMovies.isLoadingInitialMovieList,
          false,
        );
        expect(
          movieListPageStore.topRatedMovies.hasErrorLoadingInitialMovieList,
          true,
        );
        expect(
          movieListPageStore.topRatedMovies.movieList,
          [],
        );
      });

      test('should not do anything if its already loading', () {
        movieListPageStore.topRatedMovies.setIsLoadingInitialMovieList(true);

        movieListPageController.fetchInitialTopRatedMoviesList();

        verifyZeroInteractions(getTopRatedMoviesListUseCase);
      });
    });

    group('fetchInitialNowPlayingMovieList', () {
      test(
          'should handle state correctly when getNowPlayingMoviesUsecase returns successfully',
          () async {
        when(getNowPlayingMoviesListUseCase.call(any))
            .thenAnswer((_) async => Right(exampleResponse));

        final future =
            movieListPageController.fetchInitialNowPlayingMoviesList();

        verify(getNowPlayingMoviesListUseCase.call(any));
        verifyNoMoreInteractions(getNowPlayingMoviesListUseCase);
        expect(
          movieListPageStore.nowPlayingMovies.isLoadingInitialMovieList,
          true,
        );
        expect(
          movieListPageStore.nowPlayingMovies.hasErrorLoadingInitialMovieList,
          false,
        );

        await future;

        expect(
          movieListPageStore.nowPlayingMovies.isLoadingInitialMovieList,
          false,
        );
        expect(
          movieListPageStore.nowPlayingMovies.hasErrorLoadingInitialMovieList,
          false,
        );
        expect(
          movieListPageStore.nowPlayingMovies.movieList,
          exampleResponse.results,
        );
      });

      test(
          'should handle state correctly when getNowPlayingMoviesUsecase fails',
          () async {
        when(getNowPlayingMoviesListUseCase.call(any))
            .thenAnswer((_) async => Left(Failure()));

        final future =
            movieListPageController.fetchInitialNowPlayingMoviesList();

        verify(getNowPlayingMoviesListUseCase.call(any));
        verifyNoMoreInteractions(getNowPlayingMoviesListUseCase);
        expect(
          movieListPageStore.nowPlayingMovies.isLoadingInitialMovieList,
          true,
        );
        expect(
          movieListPageStore.nowPlayingMovies.hasErrorLoadingInitialMovieList,
          false,
        );

        await future;

        expect(
          movieListPageStore.nowPlayingMovies.isLoadingInitialMovieList,
          false,
        );
        expect(
          movieListPageStore.nowPlayingMovies.hasErrorLoadingInitialMovieList,
          true,
        );
        expect(
          movieListPageStore.nowPlayingMovies.movieList,
          [],
        );
      });

      test('should not do anything if its already loading', () {
        movieListPageStore.nowPlayingMovies.setIsLoadingInitialMovieList(true);

        movieListPageController.fetchInitialNowPlayingMoviesList();

        verifyZeroInteractions(getNowPlayingMoviesListUseCase);
      });
    });
  });

  group('fetchMorePopularMovies', () {
    test(
        'should handle state correctly when getPopularMoviesUsecase returns successfully',
        () async {
      when(getPopularMoviesListUseCase.call(any))
          .thenAnswer((_) async => Right(exampleResponse));

      final previousList = movieListPageStore.popularMovies.movieList;

      final future = movieListPageController.fetchMorePopularMovies();

      verify(getPopularMoviesListUseCase.call(any));
      verifyNoMoreInteractions(getPopularMoviesListUseCase);
      expect(
        movieListPageStore.popularMovies.isLoadingMoreMovies,
        true,
      );

      await future;

      expect(
        movieListPageStore.popularMovies.isLoadingMoreMovies,
        false,
      );
      expect(
        movieListPageStore.popularMovies.movieList,
        [...previousList, ...exampleResponse.results],
      );
    });

    test('should handle state correctly when getPopularMoviesUsecase fails',
        () async {
      when(getPopularMoviesListUseCase.call(any))
          .thenAnswer((_) async => Left(Failure()));

      final future = movieListPageController.fetchMorePopularMovies();

      verify(getPopularMoviesListUseCase.call(any));
      verifyNoMoreInteractions(getPopularMoviesListUseCase);
      expect(
        movieListPageStore.popularMovies.isLoadingMoreMovies,
        true,
      );

      await future;

      expect(
        movieListPageStore.popularMovies.isLoadingMoreMovies,
        false,
      );
    });

    test('should not do anything if its already loading', () {
      movieListPageStore.popularMovies.setIsLoadingMoreMovies(true);

      movieListPageController.fetchMorePopularMovies();

      verifyZeroInteractions(getPopularMoviesListUseCase);
    });

    test('should not do anything if has reached last page', () {
      movieListPageStore.popularMovies.setTotalPages(3);
      movieListPageStore.popularMovies.setLastFetchedPage(3);

      movieListPageController.fetchMorePopularMovies();

      verifyZeroInteractions(getPopularMoviesListUseCase);
    });
  });

  group('fetchMoreTopRatedMovies', () {
    test(
        'should handle state correctly when getTopRatedMoviesUsecase returns successfully',
        () async {
      when(getTopRatedMoviesListUseCase.call(any))
          .thenAnswer((_) async => Right(exampleResponse));

      final previousList = movieListPageStore.topRatedMovies.movieList;

      final future = movieListPageController.fetchMoreTopRatedMovies();

      verify(getTopRatedMoviesListUseCase.call(any));
      verifyNoMoreInteractions(getTopRatedMoviesListUseCase);
      expect(
        movieListPageStore.topRatedMovies.isLoadingMoreMovies,
        true,
      );

      await future;

      expect(
        movieListPageStore.topRatedMovies.isLoadingMoreMovies,
        false,
      );
      expect(
        movieListPageStore.topRatedMovies.movieList,
        [...previousList, ...exampleResponse.results],
      );
    });

    test('should handle state correctly when getTopRatedMoviesUsecase fails',
        () async {
      when(getTopRatedMoviesListUseCase.call(any))
          .thenAnswer((_) async => Left(Failure()));

      final future = movieListPageController.fetchMoreTopRatedMovies();

      verify(getTopRatedMoviesListUseCase.call(any));
      verifyNoMoreInteractions(getTopRatedMoviesListUseCase);
      expect(
        movieListPageStore.topRatedMovies.isLoadingMoreMovies,
        true,
      );

      await future;

      expect(
        movieListPageStore.topRatedMovies.isLoadingMoreMovies,
        false,
      );
    });

    test('should not do anything if its already loading', () {
      movieListPageStore.topRatedMovies.setIsLoadingMoreMovies(true);

      movieListPageController.fetchMoreTopRatedMovies();

      verifyZeroInteractions(getTopRatedMoviesListUseCase);
    });

    test('should not do anything if has reached last page', () {
      movieListPageStore.topRatedMovies.setTotalPages(3);
      movieListPageStore.topRatedMovies.setLastFetchedPage(3);

      movieListPageController.fetchMoreTopRatedMovies();

      verifyZeroInteractions(getTopRatedMoviesListUseCase);
    });
  });

  group('fetchMoreNowPlayingMovies', () {
    test(
        'should handle state correctly when getNowPlayingMoviesUsecase returns successfully',
        () async {
      when(getNowPlayingMoviesListUseCase.call(any))
          .thenAnswer((_) async => Right(exampleResponse));

      final previousList = movieListPageStore.nowPlayingMovies.movieList;

      final future = movieListPageController.fetchMoreNowPlayingMovies();

      verify(getNowPlayingMoviesListUseCase.call(any));
      verifyNoMoreInteractions(getNowPlayingMoviesListUseCase);
      expect(
        movieListPageStore.nowPlayingMovies.isLoadingMoreMovies,
        true,
      );

      await future;

      expect(
        movieListPageStore.nowPlayingMovies.isLoadingMoreMovies,
        false,
      );
      expect(
        movieListPageStore.nowPlayingMovies.movieList,
        [...previousList, ...exampleResponse.results],
      );
    });

    test('should handle state correctly when getNowPlayingMoviesUsecase fails',
        () async {
      when(getNowPlayingMoviesListUseCase.call(any))
          .thenAnswer((_) async => Left(Failure()));

      final future = movieListPageController.fetchMoreNowPlayingMovies();

      verify(getNowPlayingMoviesListUseCase.call(any));
      verifyNoMoreInteractions(getNowPlayingMoviesListUseCase);
      expect(
        movieListPageStore.nowPlayingMovies.isLoadingMoreMovies,
        true,
      );

      await future;

      expect(
        movieListPageStore.nowPlayingMovies.isLoadingMoreMovies,
        false,
      );
    });

    test('should not do anything if its already loading', () {
      movieListPageStore.nowPlayingMovies.setIsLoadingMoreMovies(true);

      movieListPageController.fetchMoreNowPlayingMovies();

      verifyZeroInteractions(getNowPlayingMoviesListUseCase);
    });

    test('should not do anything if has reached last page', () {
      movieListPageStore.nowPlayingMovies.setTotalPages(3);
      movieListPageStore.nowPlayingMovies.setLastFetchedPage(3);

      movieListPageController.fetchMoreNowPlayingMovies();

      verifyZeroInteractions(getNowPlayingMoviesListUseCase);
    });
  });
}
