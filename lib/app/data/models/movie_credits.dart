import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pilar_mobile_challenge/app/data/models/movie_cast.dart';

part 'movie_credits.freezed.dart';
part 'movie_credits.g.dart';

@freezed
class MovieCredits with _$MovieCredits {
  factory MovieCredits({
    required int id,
    required List<MovieCast> cast,
  }) = _MovieCredits;

  factory MovieCredits.fromJson(Map<String, dynamic> json) =>
      _$MovieCreditsFromJson(json);
}
