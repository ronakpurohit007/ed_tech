class DateUtil{
  static String formatDate(String isoDateString) {
  /// Parse the ISO date string into a DateTime object.
  DateTime dateTime = DateTime.parse(isoDateString);
  
  /// Calculate the time difference between now and the parsed date.
  Duration diff = DateTime.now().difference(dateTime);

  if (diff.inSeconds < 60) {
    return "${diff.inSeconds} sec";
  } else if (diff.inMinutes < 60) {
    return "${diff.inMinutes} min";
  } else if (diff.inHours < 24) {
    return "${diff.inHours} hour";
  } else {
    /// If the difference is more than or equal to 24 hours,
    /// format the date as "dd-MM-yyyy".
    String day = dateTime.day.toString().padLeft(2, '0');
    String month = dateTime.month.toString().padLeft(2, '0');
    String year = dateTime.year.toString();
    return "$day-$month-$year";
  }
}
}