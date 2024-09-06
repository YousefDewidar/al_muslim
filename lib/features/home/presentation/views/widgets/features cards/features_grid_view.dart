import 'package:al_muslim/core/utils/images_data.dart';
import 'package:al_muslim/core/widgets/isnside_noti.dart';
import 'package:al_muslim/features/athkar/views/all_azkar_page.dart';
import 'package:al_muslim/features/favorites/presentation/view/fav_view.dart';
import 'package:al_muslim/features/hadith/presentation/view/hadith_view.dart';
import 'package:al_muslim/features/home/data/masr_quran_services.dart';
import 'package:al_muslim/features/home/presentation/views/widgets/features%20cards/feature_card.dart';
import 'package:al_muslim/features/qubla/presentation/views/qibla_view.dart';
import 'package:al_muslim/features/radio/views/all_radios_view.dart';
import 'package:al_muslim/features/radio/views/masr_radio_view.dart';
import 'package:al_muslim/features/sabha/presentation/views/sebha_view.dart';
import 'package:al_muslim/features/salah/presentation/view/salah_view.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

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
                Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.rightToLeft,
                      child: const HadithView()),
                );
              },
            ),
            FeatureCard(
              title: 'الصلاة',
              imagePath: ImageData.prayTime,
              onTap: () {
                Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.rightToLeft,
                      child: const SalahView()),
                );
              },
            ),
            FeatureCard(
              title: 'رأديو',
              imagePath: ImageData.radio,
              onTap: () {
                Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.rightToLeft,
                      child: const AllRadiosView()),
                );
              },
            ),
            FeatureCard(
              title: 'الأذكار',
              imagePath: ImageData.pray,
              onTap: () {
                Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.rightToLeft,
                      child: const ALlAzkarView()),
                );
              },
            ),
            FutureBuilder(
              future: MasrQuranServices().fetchUrl(),
              builder: (context, snapShot) {
                return FeatureCard(
                  title: ' اذاعه مصر',
                  imagePath: ImageData.radioMasr,
                  onTap: () async {
                    if (snapShot.hasData) {
                      Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.rightToLeft,
                            child: RadioMasrView(url: snapShot.data!)),
                      );
                    } else {
                      InsideNotification.insideNotificationCard(
                          contentType: ContentType.warning,
                          context: context,
                          title: 'حدث خطأ',
                          content: 'تأكد من اتصالك بالانترنت');
                    }
                  },
                );
              },
            ),
            FeatureCard(
              title: 'المفضلة',
              imagePath: ImageData.bookmark,
              onTap: () {
                Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.rightToLeft,
                      child: const FavView()),
                );
              },
            ),
            FeatureCard(
              title: 'القبلة',
              imagePath: ImageData.qibla,
              onTap: () {
                Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.rightToLeft,
                      child: const QiblaView()),
                );
              },
            ),
            FeatureCard(
              title: 'السبحة',
              imagePath: ImageData.thbha,
              onTap: () {
                Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.rightToLeft,
                      child: const SebhaView()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
