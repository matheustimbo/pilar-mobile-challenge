import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:pilar_mobile_challenge/app/app.dart';
import 'package:pilar_mobile_challenge/app/di.dart';

void main() async {
  await initializeDateFormatting('pt_BR', null);
  DI.setup();
  runApp(const App());
}
