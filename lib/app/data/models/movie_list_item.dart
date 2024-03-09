// ignore_for_file: non_constant_identifier_names, invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'movie_list_item.freezed.dart';
part 'movie_list_item.g.dart';

@freezed
class MovieListItem with _$MovieListItem {
  factory MovieListItem({
    required bool adult,
    required int id,
    required String title,
    required double vote_average,
    required String? poster_path,
    required String? backdrop_path,
    required String overview,
    @DateConverter() required DateTime? release_date,
  }) = _MovieListItem;

  factory MovieListItem.fromJson(Map<String, dynamic> json) =>
      _$MovieListItemFromJson(json);
}

class DateConverter implements JsonConverter<DateTime?, String> {
  const DateConverter();

  @override
  DateTime? fromJson(String dateString) {
    if (dateString.isEmpty) {
      return null;
    }
    return DateTime.parse(dateString);
  }

  @override
  String toJson(DateTime? date) =>
      date == null ? "" : DateFormat('yyyy-MM-dd').format(date);
}
