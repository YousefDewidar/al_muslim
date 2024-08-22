class Date {
  final String dayName;
  final String dayHnum;
  final String monthHName;
  final String date;

  Date({
    required this.date,
    required this.dayHnum,
    required this.dayName,
    required this.monthHName,
  });

  factory Date.fromJson(Map<String, dynamic> json) {
    return Date(
      date: json['data']['date']['gregorian']['date'],
      dayHnum: json['data']['date']['hijri']['day'],
      dayName: json['data']['date']['hijri']['weekday']['ar'],
      monthHName: json['data']['date']['hijri']['month']['ar'],
    );
  }
}
