import 'package:al_muslim/features/athkar/views/reading_azkar_page.dart';
import 'package:flutter/material.dart';

class ZekrCategoryCard extends StatelessWidget {
  final String categoryName;
  final int startIndex;
  const ZekrCategoryCard(
      {super.key, required this.categoryName, required this.startIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      height: 50,
      decoration: const BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => AzkarRead(
                startIndex: startIndex,
                zecrCategory: categoryName,
              ),
            ),
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(Icons.arrow_back_ios_rounded),
            Text(
              categoryName,
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
