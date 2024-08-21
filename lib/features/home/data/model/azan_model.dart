import 'package:flutter/material.dart';

class AzanModel {
  final String title;
  final IconData icon;
  final String time;

  AzanModel({
    required this.title,
    required this.icon,
    required this.time,
  });
  factory AzanModel.fromJson(json) {
    return AzanModel(
      title: 'title',
      icon: Icons.abc,
      time: 'time',
    );
  }
  // Map<String, dynamic> toJson() {
  //   return;
  // }
}
