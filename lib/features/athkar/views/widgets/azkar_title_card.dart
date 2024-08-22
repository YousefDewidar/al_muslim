import 'package:al_muslim/features/athkar/views/reading_azkar_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AzkarTitleCard extends StatelessWidget {
  final String categorytTitle;
  final int pageid;
  const AzkarTitleCard(
      {super.key, required this.categorytTitle, required this.pageid});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 30),
      child: GestureDetector(
        onTap: () {
          Get.to(() => ReadingAzkarView(
                pageid: pageid,
              ));
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
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Text(
                    categorytTitle,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
                Image.asset(
                  'assets/icons/Beads.png',
                  height: 30,
                  width: 30,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
