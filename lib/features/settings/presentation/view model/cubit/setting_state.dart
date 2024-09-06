class SettingState {}

final class SettingInitial extends SettingState {}

final class DoneLoadData extends SettingState {}

final class RefreshDone extends SettingState {
 final  bool isRefreshed;

  RefreshDone({required this.isRefreshed});
}
