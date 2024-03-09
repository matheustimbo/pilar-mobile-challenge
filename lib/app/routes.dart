import 'package:flutter/material.dart';
import 'package:pilar_mobile_challenge/app/presentation/pages/movie_details_page.dart';
import 'package:pilar_mobile_challenge/app/presentation/pages/movie_list_page.dart';
import 'package:pilar_mobile_challenge/app/presentation/pages/movie_search_page.dart';
import 'package:pilar_mobile_challenge/app/presentation/pages/not_found_page.dart';

class RootRouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case MovieSearchPage.routeName:
        if (args is MovieSearchPageArgs) {
          return MaterialPageRoute(
            builder: (_) => MovieSearchPage(
              args: args,
            ),
          );
        }
        return MaterialPageRoute(builder: (_) => const NotFoundPage());
      case MovieListPage.routeName:
        return MaterialPageRoute(builder: (_) => const MovieListPage());
      case MovieDetailsPage.routeName:
        if (args is MovieDetailsPageArgs) {
          return MaterialPageRoute(
            builder: (_) => MovieDetailsPage(
              args: args,
            ),
          );
        }
        return MaterialPageRoute(builder: (_) => const NotFoundPage());
      default:
        return MaterialPageRoute(builder: (_) => const NotFoundPage());
    }
  }
}
