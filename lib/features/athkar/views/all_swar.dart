import 'package:al_muslim/features/athkar/views/widgets/all_swar_body.dart';
import 'package:flutter/material.dart';

class AllSwarView extends StatelessWidget {
  const AllSwarView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: AllSwarViewBody()),
    );
  }
}