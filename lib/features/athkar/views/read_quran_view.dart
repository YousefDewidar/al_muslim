import 'package:al_muslim/features/athkar/views/widgets/read_quran_view_body.dart';
import 'package:flutter/material.dart';

class ReadQuranView extends StatelessWidget {
  const ReadQuranView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(child: ReadQuranViewBody()),);
  }
}