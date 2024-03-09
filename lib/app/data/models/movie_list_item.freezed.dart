// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movie_list_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MovieListItem _$MovieListItemFromJson(Map<String, dynamic> json) {
  return _MovieListItem.fromJson(json);
}

/// @nodoc
mixin _$MovieListItem {
  bool get adult => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  double get vote_average => throw _privateConstructorUsedError;
  String? get poster_path => throw _privateConstructorUsedError;
  String? get backdrop_path => throw _privateConstructorUsedError;
  String get overview => throw _privateConstructorUsedError;
  @DateConverter()
  DateTime? get release_date => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MovieListItemCopyWith<MovieListItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovieListItemCopyWith<$Res> {
  factory $MovieListItemCopyWith(
          MovieListItem value, $Res Function(MovieListItem) then) =
      _$MovieListItemCopyWithImpl<$Res, MovieListItem>;
  @useResult
  $Res call(
      {bool adult,
      int id,
      String title,
      double vote_average,
      String? poster_path,
      String? backdrop_path,
      String overview,
      @DateConverter() DateTime? release_date});
}

/// @nodoc
class _$MovieListItemCopyWithImpl<$Res, $Val extends MovieListItem>
    implements $MovieListItemCopyWith<$Res> {
  _$MovieListItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? adult = null,
    Object? id = null,
    Object? title = null,
    Object? vote_average = null,
    Object? poster_path = freezed,
    Object? backdrop_path = freezed,
    Object? overview = null,
    Object? release_date = freezed,
  }) {
    return _then(_value.copyWith(
      adult: null == adult
          ? _value.adult
          : adult // ignore: cast_nullable_to_non_nullable
              as bool,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      vote_average: null == vote_average
          ? _value.vote_average
          : vote_average // ignore: cast_nullable_to_non_nullable
              as double,
      poster_path: freezed == poster_path
          ? _value.poster_path
          : poster_path // ignore: cast_nullable_to_non_nullable
              as String?,
      backdrop_path: freezed == backdrop_path
          ? _value.backdrop_path
          : backdrop_path // ignore: cast_nullable_to_non_nullable
              as String?,
      overview: null == overview
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as String,
      release_date: freezed == release_date
          ? _value.release_date
          : release_date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MovieListItemImplCopyWith<$Res>
    implements $MovieListItemCopyWith<$Res> {
  factory _$$MovieListItemImplCopyWith(
          _$MovieListItemImpl value, $Res Function(_$MovieListItemImpl) then) =
      __$$MovieListItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool adult,
      int id,
      String title,
      double vote_average,
      String? poster_path,
      String? backdrop_path,
      String overview,
      @DateConverter() DateTime? release_date});
}

/// @nodoc
class __$$MovieListItemImplCopyWithImpl<$Res>
    extends _$MovieListItemCopyWithImpl<$Res, _$MovieListItemImpl>
    implements _$$MovieListItemImplCopyWith<$Res> {
  __$$MovieListItemImplCopyWithImpl(
      _$MovieListItemImpl _value, $Res Function(_$MovieListItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? adult = null,
    Object? id = null,
    Object? title = null,
    Object? vote_average = null,
    Object? poster_path = freezed,
    Object? backdrop_path = freezed,
    Object? overview = null,
    Object? release_date = freezed,
  }) {
    return _then(_$MovieListItemImpl(
      adult: null == adult
          ? _value.adult
          : adult // ignore: cast_nullable_to_non_nullable
              as bool,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      vote_average: null == vote_average
          ? _value.vote_average
          : vote_average // ignore: cast_nullable_to_non_nullable
              as double,
      poster_path: freezed == poster_path
          ? _value.poster_path
          : poster_path // ignore: cast_nullable_to_non_nullable
              as String?,
      backdrop_path: freezed == backdrop_path
          ? _value.backdrop_path
          : backdrop_path // ignore: cast_nullable_to_non_nullable
              as String?,
      overview: null == overview
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as String,
      release_date: freezed == release_date
          ? _value.release_date
          : release_date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MovieListItemImpl implements _MovieListItem {
  _$MovieListItemImpl(
      {required this.adult,
      required this.id,
      required this.title,
      required this.vote_average,
      required this.poster_path,
      required this.backdrop_path,
      required this.overview,
      @DateConverter() required this.release_date});

  factory _$MovieListItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$MovieListItemImplFromJson(json);

  @override
  final bool adult;
  @override
  final int id;
  @override
  final String title;
  @override
  final double vote_average;
  @override
  final String? poster_path;
  @override
  final String? backdrop_path;
  @override
  final String overview;
  @override
  @DateConverter()
  final DateTime? release_date;

  @override
  String toString() {
    return 'MovieListItem(adult: $adult, id: $id, title: $title, vote_average: $vote_average, poster_path: $poster_path, backdrop_path: $backdrop_path, overview: $overview, release_date: $release_date)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MovieListItemImpl &&
            (identical(other.adult, adult) || other.adult == adult) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.vote_average, vote_average) ||
                other.vote_average == vote_average) &&
            (identical(other.poster_path, poster_path) ||
                other.poster_path == poster_path) &&
            (identical(other.backdrop_path, backdrop_path) ||
                other.backdrop_path == backdrop_path) &&
            (identical(other.overview, overview) ||
                other.overview == overview) &&
            (identical(other.release_date, release_date) ||
                other.release_date == release_date));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, adult, id, title, vote_average,
      poster_path, backdrop_path, overview, release_date);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MovieListItemImplCopyWith<_$MovieListItemImpl> get copyWith =>
      __$$MovieListItemImplCopyWithImpl<_$MovieListItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MovieListItemImplToJson(
      this,
    );
  }
}

abstract class _MovieListItem implements MovieListItem {
  factory _MovieListItem(
          {required final bool adult,
          required final int id,
          required final String title,
          required final double vote_average,
          required final String? poster_path,
          required final String? backdrop_path,
          required final String overview,
          @DateConverter() required final DateTime? release_date}) =
      _$MovieListItemImpl;

  factory _MovieListItem.fromJson(Map<String, dynamic> json) =
      _$MovieListItemImpl.fromJson;

  @override
  bool get adult;
  @override
  int get id;
  @override
  String get title;
  @override
  double get vote_average;
  @override
  String? get poster_path;
  @override
  String? get backdrop_path;
  @override
  String get overview;
  @override
  @DateConverter()
  DateTime? get release_date;
  @override
  @JsonKey(ignore: true)
  _$$MovieListItemImplCopyWith<_$MovieListItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
