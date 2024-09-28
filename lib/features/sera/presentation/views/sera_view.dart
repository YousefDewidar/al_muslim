import 'package:al_muslim/core/widgets/custom_app_bar.dart';
import 'package:al_muslim/features/sera/data/model/sera_lesson_model.dart';
import 'package:al_muslim/features/sera/presentation/views/widgets/sera_lesson_card.dart';
import 'package:flutter/material.dart';

class SeraView extends StatelessWidget {
  const SeraView({super.key});

  @override
  Widget build(BuildContext context) {
    List<SeraLessonModel> seraList = [
      SeraLessonModel(
          lessonLink:
              'https://www.youtube.com/watch?v=LI99lWP1zac&list=PLATApN30c4aLXpHzO1GkEb9H0CeXaJFy9&index=1',
          lessonTitle:'الدرس الأول- العالم قبل الإسلام'),
      SeraLessonModel(
          lessonLink:
              'https://www.youtube.com/watch?v=A6_y0HuwSQw&list=PLATApN30c4aLXpHzO1GkEb9H0CeXaJFy9&index=2',
          lessonTitle: 'الدرس الثاني- مولد النبي وبداية شبابه'),
      SeraLessonModel(
          lessonLink:
              'https://www.youtube.com/watch?v=LI99lWP1zac&list=PLATApN30c4aLXpHzO1GkEb9H0CeXaJFy9',
          lessonTitle: 'الدرس الثالث'),
      SeraLessonModel(
          lessonLink:
              'https://www.youtube.com/watch?v=LI99lWP1zac&list=PLATApN30c4aLXpHzO1GkEb9H0CeXaJFy9',
          lessonTitle: 'الدرس الرابع'),
    ];

    return Scaffold(
      body: Column(
        children: [
          const CustomAppBar(
            header: 'السيرة النبوية',
            desc: 'مجموعة فيديوهات احمد عامر لشرح ودراسة السيرة النبوية',
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: seraList.length,
              itemBuilder: (context, index) {
                return SeralessonCard(
                  lesson: seraList[index],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
