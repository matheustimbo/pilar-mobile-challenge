import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:patrol/patrol.dart';
import 'package:pilar_mobile_challenge/app/app.dart';
import 'package:pilar_mobile_challenge/app/di.dart';

void main() {
  patrolTest(
      'navigates to search page with batman query, changes search query to dragon ball super and then, tap on Dragon Ball Super: Super Hero movie and wait until Sinopse text is visible',
      ($) async {
    await initializeDateFormatting('pt_BR', null);
    DI.setup();
    await $.pumpWidgetAndSettle(const App());

    expect($('Bem-Vindo(a).'), findsOneWidget);

    expect($(#home_search_text_field), findsOneWidget);

    await $(#home_search_text_field).enterText('batman');

    await $(#home_search_button).tap();

    await $.pumpAndSettle();

    await $(#movies_search_page).waitUntilExists();

    await $(#movies_search_page).waitUntilVisible();

    await $('Batman').waitUntilVisible();

    expect($('Resultado da Busca'), findsOneWidget);

    await $(#movies_search_page_search_text_field)
        .enterText('dragon ball super');

    await $('Dragon Ball Super: Super Hero').waitUntilVisible().tap();

    await $.pumpAndSettle();

    expect($('Sinopse'), findsOneWidget);
  });
}
