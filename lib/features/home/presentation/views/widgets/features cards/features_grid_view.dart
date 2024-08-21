
import 'package:al_muslim/core/utils/images_data.dart';
import 'package:al_muslim/features/home/presentation/views/widgets/features%20cards/feature_card.dart';
import 'package:flutter/material.dart';

class FeaturesGridView extends StatelessWidget {
  const FeaturesGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 4.7,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: GridView.count(
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 4,
          children: [
            FeatureCard(title: 'الأحاديث', imagePath: ImageData.book),
            FeatureCard(title: 'الصلاة', imagePath: ImageData.prayTime),
            FeatureCard(title: 'الأدعية', imagePath: ImageData.du3aa),
            FeatureCard(title: 'الأذكار', imagePath: ImageData.pray),
            FeatureCard(title: 'الاعدادات', imagePath: ImageData.sitting),
            FeatureCard(title: 'المفضلة', imagePath: ImageData.bookmark),
            FeatureCard(title: 'القبلة', imagePath: ImageData.qibla),
            FeatureCard(title: 'السبحة', imagePath: ImageData.thbha),
          ],
        ),
      ),
    );
  }
}
