// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MovieDetailsImpl _$$MovieDetailsImplFromJson(Map<String, dynamic> json) =>
    _$MovieDetailsImpl(
      id: json['id'] as int,
      genres: (json['genres'] as List<dynamic>)
          .map((e) => Genre.fromJson(e as Map<String, dynamic>))
          .toList(),
      runtime: json['runtime'] as int,
      tagline: json['tagline'] as String,
      adult: json['adult'] as bool,
      vote_average: (json['vote_average'] as num).toDouble(),
      poster_path: json['poster_path'] as String?,
      backdrop_path: json['backdrop_path'] as String?,
      overview: json['overview'] as String,
      title: json['title'] as String,
      release_date: _$JsonConverterFromJson<String, DateTime?>(
          json['release_date'], const DateConverter().fromJson),
    );

Map<String, dynamic> _$$MovieDetailsImplToJson(_$MovieDetailsImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'genres': instance.genres,
      'runtime': instance.runtime,
      'tagline': instance.tagline,
      'adult': instance.adult,
      'vote_average': instance.vote_average,
      'poster_path': instance.poster_path,
      'backdrop_path': instance.backdrop_path,
      'overview': instance.overview,
      'title': instance.title,
      'release_date': const DateConverter().toJson(instance.release_date),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);
