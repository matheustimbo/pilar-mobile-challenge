// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_credits.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MovieCreditsImpl _$$MovieCreditsImplFromJson(Map<String, dynamic> json) =>
    _$MovieCreditsImpl(
      id: json['id'] as int,
      cast: (json['cast'] as List<dynamic>)
          .map((e) => MovieCast.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$MovieCreditsImplToJson(_$MovieCreditsImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cast': instance.cast,
    };
