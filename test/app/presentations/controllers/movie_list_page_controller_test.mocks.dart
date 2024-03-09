// Mocks generated by Mockito 5.4.4 from annotations
// in pilar_mobile_challenge/test/app/presentations/controllers/movie_list_page_controller_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:dartz/dartz.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:pilar_mobile_challenge/app/data/models/movies_list_response.dart'
    as _i6;
import 'package:pilar_mobile_challenge/app/domain/entities/get_movies_list_use_case_params.dart'
    as _i7;
import 'package:pilar_mobile_challenge/app/domain/usecases/get_not_playing_movies_list_use_case.dart'
    as _i9;
import 'package:pilar_mobile_challenge/app/domain/usecases/get_popular_movies_list_use_case.dart'
    as _i3;
import 'package:pilar_mobile_challenge/app/domain/usecases/get_top_rated_movies_list_use_case.dart'
    as _i8;
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

/// A class which mocks [GetPopularMoviesListUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetPopularMoviesListUseCase extends _i1.Mock
    implements _i3.GetPopularMoviesListUseCase {
  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.MoviesListResponse>> call(
          _i7.GetMoviesListUseCaseParams? param) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [param],
        ),
        returnValue:
            _i4.Future<_i2.Either<_i5.Failure, _i6.MoviesListResponse>>.value(
                _FakeEither_0<_i5.Failure, _i6.MoviesListResponse>(
          this,
          Invocation.method(
            #call,
            [param],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.Either<_i5.Failure, _i6.MoviesListResponse>>.value(
                _FakeEither_0<_i5.Failure, _i6.MoviesListResponse>(
          this,
          Invocation.method(
            #call,
            [param],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, _i6.MoviesListResponse>>);
}

/// A class which mocks [GetTopRatedMoviesListUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetTopRatedMoviesListUseCase extends _i1.Mock
    implements _i8.GetTopRatedMoviesListUseCase {
  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.MoviesListResponse>> call(
          _i7.GetMoviesListUseCaseParams? param) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [param],
        ),
        returnValue:
            _i4.Future<_i2.Either<_i5.Failure, _i6.MoviesListResponse>>.value(
                _FakeEither_0<_i5.Failure, _i6.MoviesListResponse>(
          this,
          Invocation.method(
            #call,
            [param],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.Either<_i5.Failure, _i6.MoviesListResponse>>.value(
                _FakeEither_0<_i5.Failure, _i6.MoviesListResponse>(
          this,
          Invocation.method(
            #call,
            [param],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, _i6.MoviesListResponse>>);
}

/// A class which mocks [GetNowPlayingMoviesListUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetNowPlayingMoviesListUseCase extends _i1.Mock
    implements _i9.GetNowPlayingMoviesListUseCase {
  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.MoviesListResponse>> call(
          _i7.GetMoviesListUseCaseParams? param) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [param],
        ),
        returnValue:
            _i4.Future<_i2.Either<_i5.Failure, _i6.MoviesListResponse>>.value(
                _FakeEither_0<_i5.Failure, _i6.MoviesListResponse>(
          this,
          Invocation.method(
            #call,
            [param],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.Either<_i5.Failure, _i6.MoviesListResponse>>.value(
                _FakeEither_0<_i5.Failure, _i6.MoviesListResponse>(
          this,
          Invocation.method(
            #call,
            [param],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, _i6.MoviesListResponse>>);
}