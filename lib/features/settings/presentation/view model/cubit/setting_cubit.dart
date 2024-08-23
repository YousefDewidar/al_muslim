import 'package:al_muslim/features/settings/presentation/view%20model/cubit/setting_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingCubit extends Cubit<SettingState> {
  SettingCubit() : super(SettingInitial());

  void setTheme({required ThemeMode theme}) {
    emit(ThemeChangedState(theme));
  }

  void setFont({required double font}) {
    emit(FontChangedState(font));
  }
}
