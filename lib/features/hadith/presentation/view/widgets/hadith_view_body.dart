import 'package:al_muslim/core/utils/images_data.dart';
import 'package:al_muslim/core/widgets/custom_app_bar.dart';
import 'package:al_muslim/core/widgets/space.dart';
import 'package:al_muslim/features/hadith/presentation/view/widgets/hadith_item.dart';
import 'package:flutter/material.dart';

class HadithViewBody extends StatelessWidget {
  const HadithViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomAppBar(
            header: 'الأحاديث',
            desc: "جميع الأحاديث التي تمنحك فهما أعمق لسيرة النبي"),
        const SpaceV(20),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: GridView.count(
              padding: EdgeInsets.zero,
              crossAxisCount: 3,
              childAspectRatio: 3 / 4.2,
              mainAxisSpacing: 22,
              crossAxisSpacing: 10,
              children: [
                HadithItem(
                  image: ImageData.buhary,
                  title: 'صحيح البخاري',
                  sahehName: 'bukhari',
                ),
                HadithItem(
                  image: ImageData.trmzy,
                  title: 'جامع الترمذي',
                  sahehName: 'tirmidzi',
                ),
                HadithItem(
                  image: ImageData.ahmed,
                  title: 'مسند احمد',
                  sahehName: 'ahmad',
                ),
                HadithItem(
                  image: ImageData.dawood,
                  title: "سنن ابي داود",
                  sahehName: "abu-dawud",
                ),
                HadithItem(
                  image: ImageData.magaa,
                  title: 'سنن ابن ماجه',
                  sahehName: 'ibnu-majah',
                ),
                HadithItem(
                  image: ImageData.mowata,
                  title: 'موطأ مالك',
                  sahehName: 'malik',
                ),
                HadithItem(
                  image: ImageData.nsa,
                  title: 'سنن النسائي',
                  sahehName: 'nasai',
                ),
                HadithItem(
                  image: ImageData.muslim,
                  title: 'صحيح مسلم',
                  sahehName: 'muslim',
                ),
                HadithItem(
                  image: ImageData.daarimee,
                  title: "سنن الدارمي",
                  sahehName: 'darimi',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
