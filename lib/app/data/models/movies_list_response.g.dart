// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MovieListResponseImpl _$$MovieListResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$MovieListResponseImpl(
      page: json['page'] as int,
      results: (json['results'] as List<dynamic>)
          .map((e) => MovieListItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      total_pages: json['total_pages'] as int,
      total_results: json['total_results'] as int,
    );

Map<String, dynamic> _$$MovieListResponseImplToJson(
        _$MovieListResponseImpl instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
      'total_pages': instance.total_pages,
      'total_results': instance.total_results,
    };
