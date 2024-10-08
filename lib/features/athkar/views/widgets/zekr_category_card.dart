import 'package:al_muslim/features/athkar/views/reading_azkar_page.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class ZekrCategoryCard extends StatelessWidget {
  final String categoryName;
  final int startIndex;
  const ZekrCategoryCard(
      {super.key, required this.categoryName, required this.startIndex});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageTransition(
            alignment: Alignment.center,
            child: AzkarRead(
              startIndex: startIndex,
              zecrCategory: categoryName,
            ),
            type: PageTransitionType.fade,
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        height: 50,
        decoration: const BoxDecoration(
          // color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(Icons.arrow_back_ios_rounded),
            Text(categoryName,
                // style: const TextStyle(fontSize: 20),
                style: Theme.of(context).textTheme.labelLarge!),
          ],
        ),
      ),
    );
  }
}
