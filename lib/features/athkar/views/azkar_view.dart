import 'package:al_muslim/features/athkar/views/widgets/azkar_view_body.dart';
import 'package:flutter/material.dart';

class AzkarView extends StatelessWidget {
  const AzkarView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: AzkarViewBody(),
      ),
    );
  }
}
