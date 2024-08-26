import 'package:al_muslim/features/alquran/views/widgets/fehres_view_body.dart';
import 'package:flutter/material.dart';

class FehresView extends StatelessWidget {
  const FehresView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: FehresViewBody()),
    );
  }
}
