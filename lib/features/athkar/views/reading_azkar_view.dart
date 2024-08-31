import 'package:flutter/material.dart';

import 'widgets/reading_azkar_view_body.dart';

class ReadingAzkarView extends StatelessWidget {
  final int startIndex;
  const ReadingAzkarView({
    super.key, required this.startIndex,
  });

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: ReadingAzkarViewBody(
        startIndex: startIndex,
      ),
    );
  }
}
