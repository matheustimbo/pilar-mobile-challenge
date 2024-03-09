import 'package:flutter/material.dart';
import 'package:pilar_mobile_challenge/app/presentation/pages/movie_details_page.dart';
import 'package:pilar_mobile_challenge/app/presentation/pages/movie_list_page.dart';
import 'package:pilar_mobile_challenge/app/presentation/pages/movie_search_page.dart';
import 'package:pilar_mobile_challenge/app/presentation/pages/not_found_page.dart';

class RootRouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    final routeUri = Uri.parse(settings.name ?? "");
    switch (routeUri.path) {
      case MovieSearchPage.routeName:
        if (args is MovieSearchPageArgs) {
          final uriWithParam = routeUri.replace(queryParameters: {
            'searchText': args.searchText,
          });
          return MaterialPageRoute(
            builder: (_) => MovieSearchPage(
              args: args,
            ),
            settings: RouteSettings(
              name: uriWithParam.toString(),
            ),
          );
        }
        if (routeUri.queryParameters['searchText'] != null) {
          return MaterialPageRoute(
            builder: (_) => MovieSearchPage(
              args: MovieSearchPageArgs(
                searchText: routeUri.queryParameters['searchText']!,
              ),
            ),
            settings: RouteSettings(
              name: settings.name,
            ),
          );
        }
        return MaterialPageRoute(builder: (_) => const NotFoundPage());
      case MovieListPage.routeName:
        return MaterialPageRoute(
          builder: (_) => const MovieListPage(),
          settings: const RouteSettings(name: '/'),
        );
      case MovieDetailsPage.routeName:
        if (args is MovieDetailsPageArgs) {
          final uriWithParam = routeUri.replace(queryParameters: {
            'movieId': args.movieId.toString(),
          });
          return MaterialPageRoute(
            builder: (_) => MovieDetailsPage(
              args: args,
            ),
            settings: RouteSettings(
              name: uriWithParam.toString(),
            ),
          );
        }
        if (routeUri.queryParameters['movieId'] != null) {
          return MaterialPageRoute(
            builder: (_) => MovieDetailsPage(
              args: MovieDetailsPageArgs(
                movieId:
                    int.tryParse(routeUri.queryParameters['movieId']!) ?? 0,
              ),
            ),
            settings: RouteSettings(
              name: settings.name,
            ),
          );
        }
        return MaterialPageRoute(builder: (_) => const NotFoundPage());
      default:
        return MaterialPageRoute(builder: (_) => const NotFoundPage());
    }
  }
}
