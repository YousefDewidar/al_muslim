import 'package:al_muslim/features/salah/presentation/view/widgets/salah_view_body.dart';
import 'package:flutter/material.dart';

class SalahView extends StatelessWidget {
  const SalahView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: Scaffold(body: SalahViewBody()));
  }
}
