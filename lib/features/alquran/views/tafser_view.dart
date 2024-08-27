import 'package:al_muslim/features/alquran/views/widgets/tafser_view_body.dart';
import 'package:flutter/material.dart';

class TafserView extends StatelessWidget {
  final int tafserstartIndex;
  const TafserView({
    super.key, required this.tafserstartIndex,
  });

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(child: TafserViewBody(tafserstartIndex:tafserstartIndex)),
    );
  }
}
