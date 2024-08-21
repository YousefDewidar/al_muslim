import 'package:flutter/material.dart';

class AzanModel {
  final String title;
  final String prayTime;
  final IconData icon;
  final Timings timings;

  AzanModel({
    required this.timings,
    required this.prayTime,
    required this.title,
    required this.icon,
  });

  factory AzanModel.fromJson(Map<String, dynamic> json) {
    return AzanModel(
      timings: Timings.fromJson(json['data']['timings']),
      prayTime: '',
      title: '',
      icon: Icons.reddit,
    );
  }
}

class Timings {
  final String fajr;
  final String dhuhr;
  final String asr;
  final String maghrib;
  final String isha;

  Timings({
    required this.fajr,
    required this.dhuhr,
    required this.asr,
    required this.maghrib,
    required this.isha,
  });

  factory Timings.fromJson(Map<String, dynamic> json) {
    return Timings(
      fajr: json['Fajr'],
      dhuhr: json['Dhuhr'],
      asr: json['Asr'],
      maghrib: json['Maghrib'],
      isha: json['Isha'],
    );
  }
}
