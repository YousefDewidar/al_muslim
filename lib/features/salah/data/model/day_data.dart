import 'package:al_muslim/features/salah/data/model/date.dart';
import 'package:al_muslim/features/salah/data/model/salah.dart';

class DayData {
  final Salah salah;

  final Date date;

  DayData({required this.date, required this.salah});

  factory DayData.fromJson(Map<String, dynamic> json) {
    return DayData(
      date: Date.fromJson(json),
      salah: Salah.fromJson(json['data']['timings']),
    );
  }
}
