class Salah {
  final String fajr;
  final String sunrise;
  final String dhuhr;
  final String asr;
  final String maghrib;
  final String isha;
  final String lastthird;
  final String midnight;

  Salah({
    required this.asr,
    required this.sunrise,
    required this.midnight,
    required this.maghrib,
    required this.lastthird,
    required this.isha,
    required this.fajr,
    required this.dhuhr,
  });

  factory Salah.fromJson(Map<String, dynamic> json) {
    return Salah(
      lastthird: json['Lastthird'],
      midnight: json['Midnight'],
      sunrise: json['Sunrise'],
      fajr: json['Fajr'],
      dhuhr: json['Dhuhr'],
      asr: json['Asr'],
      maghrib: json['Maghrib'],
      isha: json['Isha'],
    );
  }
}
