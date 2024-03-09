// Mocks generated by Mockito 5.4.4 from annotations
// in pilar_mobile_challenge/test/app/domain/usecases/search_movie_by_title_use_case_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:dartz/dartz.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:pilar_mobile_challenge/app/data/models/movie_credits.dart'
    as _i8;
import 'package:pilar_mobile_challenge/app/data/models/movie_details.dart'
    as _i7;
import 'package:pilar_mobile_challenge/app/data/models/movies_list_response.dart'
    as _i6;
import 'package:pilar_mobile_challenge/app/domain/repositories/movies_repository.dart'
    as _i3;
import 'package:pilar_mobile_challenge/shared/failures/failure.dart' as _i5;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [MoviesRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockMoviesRepository extends _i1.Mock implements _i3.MoviesRepository {
  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.MoviesListResponse>> getPopularMovies(
    int? page,
    String? language,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #getPopularMovies,
          [
            page,
            language,
          ],
        ),
        returnValue:
            _i4.Future<_i2.Either<_i5.Failure, _i6.MoviesListResponse>>.value(
                _FakeEither_0<_i5.Failure, _i6.MoviesListResponse>(
          this,
          Invocation.method(
            #getPopularMovies,
            [
              page,
              language,
            ],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.Either<_i5.Failure, _i6.MoviesListResponse>>.value(
                _FakeEither_0<_i5.Failure, _i6.MoviesListResponse>(
          this,
          Invocation.method(
            #getPopularMovies,
            [
              page,
              language,
            ],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, _i6.MoviesListResponse>>);

  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.MoviesListResponse>> getTopRatedMovies(
    int? page,
    String? language,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #getTopRatedMovies,
          [
            page,
            language,
          ],
        ),
        returnValue:
            _i4.Future<_i2.Either<_i5.Failure, _i6.MoviesListResponse>>.value(
                _FakeEither_0<_i5.Failure, _i6.MoviesListResponse>(
          this,
          Invocation.method(
            #getTopRatedMovies,
            [
              page,
              language,
            ],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.Either<_i5.Failure, _i6.MoviesListResponse>>.value(
                _FakeEither_0<_i5.Failure, _i6.MoviesListResponse>(
          this,
          Invocation.method(
            #getTopRatedMovies,
            [
              page,
              language,
            ],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, _i6.MoviesListResponse>>);

  @override
  _i4.Future<
      _i2.Either<_i5.Failure, _i6.MoviesListResponse>> getNowPlayingMovies(
    int? page,
    String? language,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #getNowPlayingMovies,
          [
            page,
            language,
          ],
        ),
        returnValue:
            _i4.Future<_i2.Either<_i5.Failure, _i6.MoviesListResponse>>.value(
                _FakeEither_0<_i5.Failure, _i6.MoviesListResponse>(
          this,
          Invocation.method(
            #getNowPlayingMovies,
            [
              page,
              language,
            ],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.Either<_i5.Failure, _i6.MoviesListResponse>>.value(
                _FakeEither_0<_i5.Failure, _i6.MoviesListResponse>(
          this,
          Invocation.method(
            #getNowPlayingMovies,
            [
              page,
              language,
            ],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, _i6.MoviesListResponse>>);

  @override
  _i4.Future<
      _i2.Either<_i5.Failure, _i6.MoviesListResponse>> searchMoviesByTitle(
    String? query,
    int? page,
    String? language,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #searchMoviesByTitle,
          [
            query,
            page,
            language,
          ],
        ),
        returnValue:
            _i4.Future<_i2.Either<_i5.Failure, _i6.MoviesListResponse>>.value(
                _FakeEither_0<_i5.Failure, _i6.MoviesListResponse>(
          this,
          Invocation.method(
            #searchMoviesByTitle,
            [
              query,
              page,
              language,
            ],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.Either<_i5.Failure, _i6.MoviesListResponse>>.value(
                _FakeEither_0<_i5.Failure, _i6.MoviesListResponse>(
          this,
          Invocation.method(
            #searchMoviesByTitle,
            [
              query,
              page,
              language,
            ],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, _i6.MoviesListResponse>>);

  @override
  _i4.Future<_i2.Either<_i5.Failure, _i7.MovieDetails>> getMovieDetails(
    int? movieId,
    String? language,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #getMovieDetails,
          [
            movieId,
            language,
          ],
        ),
        returnValue:
            _i4.Future<_i2.Either<_i5.Failure, _i7.MovieDetails>>.value(
                _FakeEither_0<_i5.Failure, _i7.MovieDetails>(
          this,
          Invocation.method(
            #getMovieDetails,
            [
              movieId,
              language,
            ],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.Either<_i5.Failure, _i7.MovieDetails>>.value(
                _FakeEither_0<_i5.Failure, _i7.MovieDetails>(
          this,
          Invocation.method(
            #getMovieDetails,
            [
              movieId,
              language,
            ],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, _i7.MovieDetails>>);

  @override
  _i4.Future<_i2.Either<_i5.Failure, _i8.MovieCredits>> getMovieCredits(
    int? movieId,
    String? language,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #getMovieCredits,
          [
            movieId,
            language,
          ],
        ),
        returnValue:
            _i4.Future<_i2.Either<_i5.Failure, _i8.MovieCredits>>.value(
                _FakeEither_0<_i5.Failure, _i8.MovieCredits>(
          this,
          Invocation.method(
            #getMovieCredits,
            [
              movieId,
              language,
            ],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.Either<_i5.Failure, _i8.MovieCredits>>.value(
                _FakeEither_0<_i5.Failure, _i8.MovieCredits>(
          this,
          Invocation.method(
            #getMovieCredits,
            [
              movieId,
              language,
            ],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, _i8.MovieCredits>>);
}
