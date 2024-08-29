
import 'package:al_muslim/core/utils/images_data.dart';
import 'package:al_muslim/features/athkar/views/azkar_view.dart';
import 'package:al_muslim/features/favorites/presentation/view/fav_view.dart';
import 'package:al_muslim/features/hadith/presentation/view/hadith_view.dart';
import 'package:al_muslim/features/home/presentation/views/widgets/features%20cards/feature_card.dart';
import 'package:al_muslim/features/qubla/presentation/views/qiblah_compass_view_body.dart';
import 'package:al_muslim/features/radio/views/all_radios_view.dart';
import 'package:al_muslim/features/radio/views/radio_view.dart';
import 'package:al_muslim/features/sabha/presentation/views/sebha_view.dart';
import 'package:al_muslim/features/salah/presentation/view/salah_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FeaturesGridView extends StatelessWidget {
  const FeaturesGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 4.62,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: GridView.count(
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 4,
          children: [
            FeatureCard(
              title: 'الأحاديث',
              imagePath: ImageData.book,
              onTap: () {
                Get.to(() => const HadithView());
              },
            ),
            FeatureCard(
              title: 'الصلاة',
              imagePath: ImageData.prayTime,
              onTap: () {
                Get.to(() => const SalahView());
              },
            ),
            FeatureCard(
              title: 'رأديو',
              imagePath: ImageData.radio,
              onTap: () {
                Get.to(() => const AllRadiosView());
              },
            ),
            FeatureCard(
              title: 'الأذكار',
              imagePath: ImageData.pray,
              onTap: () {
                Get.to(() => const AzkarView());
              },
            ),
            FeatureCard(
              title: ' اذاعه مصر',
              imagePath: ImageData.radioMasr,
              onTap: ()  {
                Get.to(() => const RadioView(
                      image: 'assets/images/masrQuranKreem.png', url: '',
                    ));
              },
            ),
            FeatureCard(
              title: 'المفضلة',
              imagePath: ImageData.bookmark,
              onTap: () {
                Get.to(() => const FavView());
              },
            ),
            FeatureCard(
              title: 'القبلة',
              imagePath: ImageData.qibla,
              onTap: () {
                Get.to(() => const QuiblaViewBody());
              },
            ),
            FeatureCard(
              title: 'السبحة',
              imagePath: ImageData.thbha,
              onTap: () {
                Get.to(() => const SebhaView());
              },
            ),
          ],
        ),
      ),
    );
  }
}
