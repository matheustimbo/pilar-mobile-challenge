// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movies_list_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MoviesListResponse _$MoviesListResponseFromJson(Map<String, dynamic> json) {
  return _MovieListResponse.fromJson(json);
}

/// @nodoc
mixin _$MoviesListResponse {
  int get page => throw _privateConstructorUsedError;
  List<MovieListItem> get results => throw _privateConstructorUsedError;
  int get total_pages => throw _privateConstructorUsedError;
  int get total_results => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MoviesListResponseCopyWith<MoviesListResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MoviesListResponseCopyWith<$Res> {
  factory $MoviesListResponseCopyWith(
          MoviesListResponse value, $Res Function(MoviesListResponse) then) =
      _$MoviesListResponseCopyWithImpl<$Res, MoviesListResponse>;
  @useResult
  $Res call(
      {int page,
      List<MovieListItem> results,
      int total_pages,
      int total_results});
}

/// @nodoc
class _$MoviesListResponseCopyWithImpl<$Res, $Val extends MoviesListResponse>
    implements $MoviesListResponseCopyWith<$Res> {
  _$MoviesListResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? results = null,
    Object? total_pages = null,
    Object? total_results = null,
  }) {
    return _then(_value.copyWith(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      results: null == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<MovieListItem>,
      total_pages: null == total_pages
          ? _value.total_pages
          : total_pages // ignore: cast_nullable_to_non_nullable
              as int,
      total_results: null == total_results
          ? _value.total_results
          : total_results // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MovieListResponseImplCopyWith<$Res>
    implements $MoviesListResponseCopyWith<$Res> {
  factory _$$MovieListResponseImplCopyWith(_$MovieListResponseImpl value,
          $Res Function(_$MovieListResponseImpl) then) =
      __$$MovieListResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int page,
      List<MovieListItem> results,
      int total_pages,
      int total_results});
}

/// @nodoc
class __$$MovieListResponseImplCopyWithImpl<$Res>
    extends _$MoviesListResponseCopyWithImpl<$Res, _$MovieListResponseImpl>
    implements _$$MovieListResponseImplCopyWith<$Res> {
  __$$MovieListResponseImplCopyWithImpl(_$MovieListResponseImpl _value,
      $Res Function(_$MovieListResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? results = null,
    Object? total_pages = null,
    Object? total_results = null,
  }) {
    return _then(_$MovieListResponseImpl(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      results: null == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<MovieListItem>,
      total_pages: null == total_pages
          ? _value.total_pages
          : total_pages // ignore: cast_nullable_to_non_nullable
              as int,
      total_results: null == total_results
          ? _value.total_results
          : total_results // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MovieListResponseImpl implements _MovieListResponse {
  _$MovieListResponseImpl(
      {required this.page,
      required final List<MovieListItem> results,
      required this.total_pages,
      required this.total_results})
      : _results = results;

  factory _$MovieListResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$MovieListResponseImplFromJson(json);

  @override
  final int page;
  final List<MovieListItem> _results;
  @override
  List<MovieListItem> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  final int total_pages;
  @override
  final int total_results;

  @override
  String toString() {
    return 'MoviesListResponse(page: $page, results: $results, total_pages: $total_pages, total_results: $total_results)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MovieListResponseImpl &&
            (identical(other.page, page) || other.page == page) &&
            const DeepCollectionEquality().equals(other._results, _results) &&
            (identical(other.total_pages, total_pages) ||
                other.total_pages == total_pages) &&
            (identical(other.total_results, total_results) ||
                other.total_results == total_results));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      page,
      const DeepCollectionEquality().hash(_results),
      total_pages,
      total_results);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MovieListResponseImplCopyWith<_$MovieListResponseImpl> get copyWith =>
      __$$MovieListResponseImplCopyWithImpl<_$MovieListResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MovieListResponseImplToJson(
      this,
    );
  }
}

abstract class _MovieListResponse implements MoviesListResponse {
  factory _MovieListResponse(
      {required final int page,
      required final List<MovieListItem> results,
      required final int total_pages,
      required final int total_results}) = _$MovieListResponseImpl;

  factory _MovieListResponse.fromJson(Map<String, dynamic> json) =
      _$MovieListResponseImpl.fromJson;

  @override
  int get page;
  @override
  List<MovieListItem> get results;
  @override
  int get total_pages;
  @override
  int get total_results;
  @override
  @JsonKey(ignore: true)
  _$$MovieListResponseImplCopyWith<_$MovieListResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
