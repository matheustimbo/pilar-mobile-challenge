import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pilar_mobile_challenge/app/data/models/genre.dart';
import 'package:pilar_mobile_challenge/shared/utils/date_converter.dart';

part 'movie_details.freezed.dart';
part 'movie_details.g.dart';

@freezed
class MovieDetails with _$MovieDetails {
  factory MovieDetails({
    required int id,
    required List<Genre> genres,
    required int runtime,
    required String tagline,
    required bool adult,
    required double vote_average,
    required String? poster_path,
    required String? backdrop_path,
    required String overview,
    required String title,
    @DateConverter() required DateTime? release_date,
  }) = _MovieDetails;

  factory MovieDetails.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailsFromJson(json);
}
