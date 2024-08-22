import 'package:al_muslim/features/home/data/model/timing.dart';
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
