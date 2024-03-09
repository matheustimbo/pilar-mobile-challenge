// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_cast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MovieCastImpl _$$MovieCastImplFromJson(Map<String, dynamic> json) =>
    _$MovieCastImpl(
      id: json['id'] as int,
      name: json['name'] as String,
      character: json['character'] as String,
      profile_path: json['profile_path'] as String?,
    );

Map<String, dynamic> _$$MovieCastImplToJson(_$MovieCastImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'character': instance.character,
      'profile_path': instance.profile_path,
    };
