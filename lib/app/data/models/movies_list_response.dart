// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pilar_mobile_challenge/app/data/models/movie_list_item.dart';

part 'movies_list_response.freezed.dart';
part 'movies_list_response.g.dart';

@freezed
class MoviesListResponse with _$MoviesListResponse {
  factory MoviesListResponse({
    required int page,
    required List<MovieListItem> results,
    required int total_pages,
    required int total_results,
  }) = _MovieListResponse;

  factory MoviesListResponse.fromJson(Map<String, dynamic> json) =>
      _$MoviesListResponseFromJson(json);
}
