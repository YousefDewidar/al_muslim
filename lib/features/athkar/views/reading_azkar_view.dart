import 'package:flutter/material.dart';

import 'widgets/reading_azkar_view_body.dart';

class ReadingAzkarView extends StatelessWidget {
  const ReadingAzkarView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: ReadingAzkarViewBody(),
      ),
    );
  }
}
