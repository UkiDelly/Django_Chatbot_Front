DateTime dateTimeFromJson(String value) => DateTime.parse(value);

String dateTimeToJson(DateTime value) => value.toIso8601String();
