import 'package:al_muslim/features/hadith/presentation/view/widgets/reading_view_body.dart';
import 'package:flutter/material.dart';

class ReadingHadithView extends StatelessWidget {
  const ReadingHadithView(
      {super.key, required this.sahehName, required this.title});
  final String sahehName;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: ReadingHadithViewBody(
      sahehName: sahehName,
      title: title,
    )));
  }
}
