import 'package:flutter_dotenv/flutter_dotenv.dart';

class Constants {
  static String apiKey = dotenv.env['TMDB_API_KEY'] ??
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhYjdlNzA3NjdkZmU0MmY4ZjcyY2Q4YjllNTkyYTQ0YyIsInN1YiI6IjVlNGM1NGJiOWI4NjE2MDAxODY3MDE3NiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.cwXiGawvofBRNarR6abFHG_LxeEGrManFqQNEdZdKPk';
  static const apiBaseUrl = 'https://api.themoviedb.org/3';
  static const String tmdbLogo =
      'https://www.themoviedb.org/assets/2/v4/logos/v2/blue_square_2-d537fb228cf3ded904ef09b136fe3fec72548ebc1fea3fbbd1ad9e36364db38b.svg';
  static const String movieCastProfilePathBaseUrl =
      'https://media.themoviedb.org/t/p/w240_and_h266_face';
  static const String moviePosterPathw260h390BaseUrl =
      'https://image.tmdb.org/t/p/w260_and_h390_bestv2';
  static const String moviePosterPathw220h330BaseUrl =
      'https://media.themoviedb.org/t/p/w220_and_h330_face';
  static const String movieBackdropPathw1000h450BaseUrl =
      'https://media.themoviedb.org/t/p/w1000_and_h450_multi_faces';
  static const String moviePosterPathw500BaseUrl =
      'https://image.tmdb.org/t/p/w500';
  static const String movieListHeaderBanner =
      'https://www.cnnbrasil.com.br/wp-content/uploads/sites/12/2023/01/the-last-of-us-serie.jpg?w=1200&h=1200&crop=1';
}
