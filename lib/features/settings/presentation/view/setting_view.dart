import 'package:al_muslim/features/settings/presentation/view/widget/setting_view_body.dart';
import 'package:flutter/material.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: Scaffold(body: SettingViewBody()));
  }
}
