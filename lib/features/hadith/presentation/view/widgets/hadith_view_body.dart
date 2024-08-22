import 'package:al_muslim/core/utils/images_data.dart';
import 'package:al_muslim/core/widgets/space.dart';
import 'package:al_muslim/features/hadith/presentation/view/widgets/hadith_item.dart';
import 'package:flutter/material.dart';

class HadithViewBody extends StatelessWidget {
  const HadithViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0),
      child: Column(
        children: [
          const SpaceV(30),
          Expanded(
            child: GridView.count(
              crossAxisCount: 3,
              childAspectRatio: 3 / 4.2,
              mainAxisSpacing: 22,
              crossAxisSpacing: 10,
              children: [
                const HadithItem(
                    image: 'assets/images/buharyy.jpeg', title: 'صحيح البخاري'),
                const HadithItem(
                    image: 'assets/images/buharyy.jpeg', title: 'جامع الترمذي'),
                HadithItem(image: ImageData.ahmed, title: 'مسند احمد'),
                HadithItem(image: ImageData.dawood, title: "سنن ابي داود"),
                HadithItem(image: ImageData.magaa, title: 'سنن ابن ماجه'),
                HadithItem(image: ImageData.mowata, title: 'موطأ مالك'),
                HadithItem(image: ImageData.nsa, title: 'سنن النسائي'),
                HadithItem(image: ImageData.muslim, title: 'صحيح مسلم'),
                HadithItem(image: ImageData.daarimee, title: "سنن الدارمي"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
