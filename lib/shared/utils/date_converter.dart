import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

class DateConverter implements JsonConverter<DateTime?, String> {
  const DateConverter();

  @override
  DateTime? fromJson(String dateString) {
    if (dateString.isEmpty) {
      return null;
    }
    return DateTime.parse(dateString);
  }

  @override
  String toJson(DateTime? date) =>
      date == null ? "" : DateFormat('yyyy-MM-dd').format(date);
}
