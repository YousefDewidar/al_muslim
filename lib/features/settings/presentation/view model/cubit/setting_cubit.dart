import 'package:al_muslim/features/settings/presentation/view%20model/cubit/setting_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingCubit extends Cubit<SettingState> {
  SettingCubit() : super(SettingInitial());

  void setTheme({required ThemeMode theme}) async {
    SharedPreferences asyncPref = await SharedPreferences.getInstance();
    asyncPref.setString('theme', theme.toString());
    emit(ThemeChangedState(theme));
  }

  void setFont({required double font}) async {
    SharedPreferences asyncPref = await SharedPreferences.getInstance();
    asyncPref.setDouble('font', font);
    emit(FontChangedState(font));
  }
}
