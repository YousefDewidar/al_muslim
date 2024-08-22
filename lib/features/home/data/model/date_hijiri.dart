class DateHijri {
  final int dayNum;
  final String month;
  final String year;
  DateHijri({
    required this.dayNum,
    required this.month,
    required this.year,
  });
  factory DateHijri.fromJson(json) {
    return DateHijri(
      dayNum: json['data']['date']['hijri']['day'],
      month: json['data']['date']['hijri']['month']['ar'],
      year: json['data']['date']['hijri']['year'],
    );
  }
}
