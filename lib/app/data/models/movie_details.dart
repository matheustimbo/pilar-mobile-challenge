import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pilar_mobile_challenge/app/data/models/genre.dart';

part 'movie_details.freezed.dart';
part 'movie_details.g.dart';

@freezed
class MovieDetails with _$MovieDetails {
  factory MovieDetails({
    required int id,
    required List<Genre> genres,
    required int runtime,
    required String tagline,
  }) = _MovieDetails;

  factory MovieDetails.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailsFromJson(json);
}
