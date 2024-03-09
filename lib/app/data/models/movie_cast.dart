import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_cast.freezed.dart';
part 'movie_cast.g.dart';

@freezed
class MovieCast with _$MovieCast {
  factory MovieCast({
    required int id,
    required String name,
    required String character,
    required String? profile_path,
  }) = _MovieCast;

  factory MovieCast.fromJson(Map<String, dynamic> json) =>
      _$MovieCastFromJson(json);
}
