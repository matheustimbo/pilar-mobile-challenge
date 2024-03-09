import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pilar_mobile_challenge/app/presentation/pages/movie_list_page.dart';
import 'package:pilar_mobile_challenge/app/routes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: const Color.fromRGBO(3, 37, 65, 1)),
        useMaterial3: true,
        textTheme: GoogleFonts.sourceSans3TextTheme(ThemeData().textTheme),
      ),
      initialRoute: MovieListPage.routeName,
      onGenerateRoute: RootRouteGenerator.generateRoute,
    );
  }
}
