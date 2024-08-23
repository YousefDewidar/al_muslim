import 'package:flutter/material.dart';

class SettingState {}

final class SettingInitial extends SettingState {}

final class ThemeChangedState extends SettingState {
  final ThemeMode theme;

  ThemeChangedState(this.theme);
}

final class FontChangedState extends SettingState {
  final double font;

  FontChangedState(this.font);
}
