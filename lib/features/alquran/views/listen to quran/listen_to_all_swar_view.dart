import 'package:al_muslim/features/alquran/views/listen%20to%20quran/widgets/listen_to_all_swar_view_body.dart';
import 'package:flutter/material.dart';

class ListenToAllSwarView extends StatelessWidget {
  const ListenToAllSwarView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: ListenToAllSwarViewBody()),
    );
  }
}