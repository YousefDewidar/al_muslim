import 'package:al_muslim/features/athkar/views/reading_azkar_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AzkarTitleCard extends StatelessWidget {
  const AzkarTitleCard({super.key,});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 30),
      child: GestureDetector(
        onTap: () {
          Get.to(() =>  const ReadingAzkarView(
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
                Text(
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  categorytTitle,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
