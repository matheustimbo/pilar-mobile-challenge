// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movie_credits.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MovieCredits _$MovieCreditsFromJson(Map<String, dynamic> json) {
  return _MovieCredits.fromJson(json);
}

/// @nodoc
mixin _$MovieCredits {
  int get id => throw _privateConstructorUsedError;
  List<MovieCast> get cast => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MovieCreditsCopyWith<MovieCredits> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovieCreditsCopyWith<$Res> {
  factory $MovieCreditsCopyWith(
          MovieCredits value, $Res Function(MovieCredits) then) =
      _$MovieCreditsCopyWithImpl<$Res, MovieCredits>;
  @useResult
  $Res call({int id, List<MovieCast> cast});
}

/// @nodoc
class _$MovieCreditsCopyWithImpl<$Res, $Val extends MovieCredits>
    implements $MovieCreditsCopyWith<$Res> {
  _$MovieCreditsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? cast = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      cast: null == cast
          ? _value.cast
          : cast // ignore: cast_nullable_to_non_nullable
              as List<MovieCast>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MovieCreditsImplCopyWith<$Res>
    implements $MovieCreditsCopyWith<$Res> {
  factory _$$MovieCreditsImplCopyWith(
          _$MovieCreditsImpl value, $Res Function(_$MovieCreditsImpl) then) =
      __$$MovieCreditsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, List<MovieCast> cast});
}

/// @nodoc
class __$$MovieCreditsImplCopyWithImpl<$Res>
    extends _$MovieCreditsCopyWithImpl<$Res, _$MovieCreditsImpl>
    implements _$$MovieCreditsImplCopyWith<$Res> {
  __$$MovieCreditsImplCopyWithImpl(
      _$MovieCreditsImpl _value, $Res Function(_$MovieCreditsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? cast = null,
  }) {
    return _then(_$MovieCreditsImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      cast: null == cast
          ? _value._cast
          : cast // ignore: cast_nullable_to_non_nullable
              as List<MovieCast>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MovieCreditsImpl implements _MovieCredits {
  _$MovieCreditsImpl({required this.id, required final List<MovieCast> cast})
      : _cast = cast;

  factory _$MovieCreditsImpl.fromJson(Map<String, dynamic> json) =>
      _$$MovieCreditsImplFromJson(json);

  @override
  final int id;
  final List<MovieCast> _cast;
  @override
  List<MovieCast> get cast {
    if (_cast is EqualUnmodifiableListView) return _cast;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cast);
  }

  @override
  String toString() {
    return 'MovieCredits(id: $id, cast: $cast)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MovieCreditsImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._cast, _cast));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, const DeepCollectionEquality().hash(_cast));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MovieCreditsImplCopyWith<_$MovieCreditsImpl> get copyWith =>
      __$$MovieCreditsImplCopyWithImpl<_$MovieCreditsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MovieCreditsImplToJson(
      this,
    );
  }
}

abstract class _MovieCredits implements MovieCredits {
  factory _MovieCredits(
      {required final int id,
      required final List<MovieCast> cast}) = _$MovieCreditsImpl;

  factory _MovieCredits.fromJson(Map<String, dynamic> json) =
      _$MovieCreditsImpl.fromJson;

  @override
  int get id;
  @override
  List<MovieCast> get cast;
  @override
  @JsonKey(ignore: true)
  _$$MovieCreditsImplCopyWith<_$MovieCreditsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
