import 'package:al_muslim/core/utils/images_data.dart';
import 'package:al_muslim/features/sera/data/model/sera_lesson_model.dart';
import 'package:al_muslim/features/sera/presentation/views/youtube_view.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class SeralessonCard extends StatelessWidget {
  final SeraLessonModel lesson;
  const SeralessonCard({
    super.key,
    required this.lesson,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          PageTransition(
            type: PageTransitionType.rightToLeft,
            child: YoutubeView(seraLessonModel: lesson),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 3),
        height: 90,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    ImageData.ahmedAmer,
                  ),
                ),
                Text(
                    textDirection: TextDirection.rtl,
                    lesson.lessonTitle,
                    style: Theme.of(context).textTheme.titleLarge!),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
