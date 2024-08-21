
import 'package:al_muslim/core/utils/images_data.dart';
import 'package:al_muslim/core/widgets/space.dart';
import 'package:flutter/material.dart';

class QuranCard extends StatelessWidget {
  const QuranCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Card(
        child: Container(
          height: MediaQuery.of(context).size.width / 5,
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('القرآن الكريم', style: TextStyle(fontSize: 30)),
              const SpaceH(20),
              Image.asset(ImageData.quran, width: 80, height:  MediaQuery.of(context).size.width / 5.2),
            ],
          ),
        ),
      ),
    );
  }
}
