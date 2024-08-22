import 'package:flutter/material.dart';

import 'widgets/reading_azkar_view_body.dart';

class ReadingAzkarView extends StatelessWidget {
  final int pageid;
  const ReadingAzkarView({super.key, required this.pageid});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: ReadingAzkarViewBody(
          pageid: pageid,
        ),
      ),
    );
  }
}
