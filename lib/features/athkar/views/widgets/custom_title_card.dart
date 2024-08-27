import 'package:al_muslim/core/widgets/space.dart';
import 'package:al_muslim/features/alquran/views/fehres_view.dart';
import 'package:al_muslim/features/alquran/views/tafser_view.dart';
import 'package:al_muslim/features/athkar/views/all_swar.dart';
import 'package:al_muslim/features/athkar/views/reading_azkar_view.dart';
import 'package:al_muslim/features/radio/views/radio_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTitleCard extends StatelessWidget {
  final String categorytTitle;
  final String pageName;
  final String? url;
  final IconData? icon;
  final int? startIndex;
  final int? tafserstartIndex;
  const CustomTitleCard({
    super.key,
    required this.categorytTitle,
    this.icon,
    this.url,
    required this.pageName,
    this.startIndex, this.tafserstartIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 30),
      child: GestureDetector(
        onTap: () {
          switch (pageName) {
            case 'redingAzkar':
              Get.to(() => ReadingAzkarView(
                    startIndex: startIndex ?? 0,
                  ));
            case 'radio':
              Get.to(() => RadioView(url: url ?? ''));
            case 'fehres':
              Get.to(() => const FehresView());
            case 'tafser':
              Get.to(() => const AllSwarView());
            case 'redingTafser':
              Get.to(() =>  TafserView(tafserstartIndex:tafserstartIndex??2));
            default:
          }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            Row(
              children: [
                SizedBox(
                  width: 320,
                  child: Text(
                    textAlign: TextAlign.right,
                    maxLines: 1,
                    overflow: TextOverflow.visible,
                    categorytTitle,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
                const SpaceH(10),
                Icon(
                  icon,
                  color: Colors.black,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
