// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_list_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MovieListItemImpl _$$MovieListItemImplFromJson(Map<String, dynamic> json) =>
    _$MovieListItemImpl(
      adult: json['adult'] as bool,
      id: json['id'] as int,
      title: json['title'] as String,
      vote_average: (json['vote_average'] as num).toDouble(),
      poster_path: json['poster_path'] as String?,
      backdrop_path: json['backdrop_path'] as String?,
      overview: json['overview'] as String,
      release_date: _$JsonConverterFromJson<String, DateTime?>(
          json['release_date'], const DateConverter().fromJson),
    );

Map<String, dynamic> _$$MovieListItemImplToJson(_$MovieListItemImpl instance) =>
    <String, dynamic>{
      'adult': instance.adult,
      'id': instance.id,
      'title': instance.title,
      'vote_average': instance.vote_average,
      'poster_path': instance.poster_path,
      'backdrop_path': instance.backdrop_path,
      'overview': instance.overview,
      'release_date': const DateConverter().toJson(instance.release_date),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);
