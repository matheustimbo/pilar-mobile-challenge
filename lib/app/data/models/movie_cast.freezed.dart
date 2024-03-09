// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movie_cast.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MovieCast _$MovieCastFromJson(Map<String, dynamic> json) {
  return _MovieCast.fromJson(json);
}

/// @nodoc
mixin _$MovieCast {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get character => throw _privateConstructorUsedError;
  String? get profile_path => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MovieCastCopyWith<MovieCast> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovieCastCopyWith<$Res> {
  factory $MovieCastCopyWith(MovieCast value, $Res Function(MovieCast) then) =
      _$MovieCastCopyWithImpl<$Res, MovieCast>;
  @useResult
  $Res call({int id, String name, String character, String? profile_path});
}

/// @nodoc
class _$MovieCastCopyWithImpl<$Res, $Val extends MovieCast>
    implements $MovieCastCopyWith<$Res> {
  _$MovieCastCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? character = null,
    Object? profile_path = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      character: null == character
          ? _value.character
          : character // ignore: cast_nullable_to_non_nullable
              as String,
      profile_path: freezed == profile_path
          ? _value.profile_path
          : profile_path // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MovieCastImplCopyWith<$Res>
    implements $MovieCastCopyWith<$Res> {
  factory _$$MovieCastImplCopyWith(
          _$MovieCastImpl value, $Res Function(_$MovieCastImpl) then) =
      __$$MovieCastImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, String character, String? profile_path});
}

/// @nodoc
class __$$MovieCastImplCopyWithImpl<$Res>
    extends _$MovieCastCopyWithImpl<$Res, _$MovieCastImpl>
    implements _$$MovieCastImplCopyWith<$Res> {
  __$$MovieCastImplCopyWithImpl(
      _$MovieCastImpl _value, $Res Function(_$MovieCastImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? character = null,
    Object? profile_path = freezed,
  }) {
    return _then(_$MovieCastImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      character: null == character
          ? _value.character
          : character // ignore: cast_nullable_to_non_nullable
              as String,
      profile_path: freezed == profile_path
          ? _value.profile_path
          : profile_path // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MovieCastImpl implements _MovieCast {
  _$MovieCastImpl(
      {required this.id,
      required this.name,
      required this.character,
      required this.profile_path});

  factory _$MovieCastImpl.fromJson(Map<String, dynamic> json) =>
      _$$MovieCastImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String character;
  @override
  final String? profile_path;

  @override
  String toString() {
    return 'MovieCast(id: $id, name: $name, character: $character, profile_path: $profile_path)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MovieCastImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.character, character) ||
                other.character == character) &&
            (identical(other.profile_path, profile_path) ||
                other.profile_path == profile_path));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, character, profile_path);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MovieCastImplCopyWith<_$MovieCastImpl> get copyWith =>
      __$$MovieCastImplCopyWithImpl<_$MovieCastImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MovieCastImplToJson(
      this,
    );
  }
}

abstract class _MovieCast implements MovieCast {
  factory _MovieCast(
      {required final int id,
      required final String name,
      required final String character,
      required final String? profile_path}) = _$MovieCastImpl;

  factory _MovieCast.fromJson(Map<String, dynamic> json) =
      _$MovieCastImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get character;
  @override
  String? get profile_path;
  @override
  @JsonKey(ignore: true)
  _$$MovieCastImplCopyWith<_$MovieCastImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
