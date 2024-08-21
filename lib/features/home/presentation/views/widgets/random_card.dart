
import 'package:al_muslim/core/widgets/space.dart';
import 'package:flutter/material.dart';

class RandomCard extends StatefulWidget {
  const RandomCard({
    super.key,
  });

  @override
  State<RandomCard> createState() => _RandomCardState();
}

class _RandomCardState extends State<RandomCard> {
  int ayah = 0;
  final List<String> ayat = [
    'رَبِّ أَدخِلني مُدخَلَ صِدقٍ وَأَخرِجني مُخرَجَ صِدقٍ وَاجعَل لي مِن لَدُنكَ سُلطانًا نَصيرًا',
    'رَّبِّ أَنزِلْنِي مُنزَلًا مُّبَارَكًا وَأَنتَ خَيْرُ الْمُنزِلِينَ',
    'اللَّهمَّ إنَّكَ عفوٌّ تحبُّ العفوَ فاعفُ عنِّي',
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .2,
      width: MediaQuery.of(context).size.width * 1,
      child: Card(
        margin: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: GestureDetector(
                    onTap: () {
                      ayah++;
                      if (ayah == ayat.length) {
                        ayah = 0;
                      }
                      setState(() {});
                    },
                    child: const CircleAvatar(
                      backgroundColor: Color(0xff3d7085),
                      radius: 20,
                      child: Icon(Icons.replay),
                    ),
                  ),
                ),
                Text(
                  'رسالتك اليوميه',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: GestureDetector(
                    child: const CircleAvatar(
                        backgroundColor: Colors.orange,
                        radius: 20,
                        child: Icon(Icons.share)),
                  ),
                ),
              ],
            ),
            const SpaceV(10),
            Text(
              textAlign: TextAlign.center,
              ayat[ayah],
              style: Theme.of(context).textTheme.titleLarge,
            )
          ],
        ),
      ),
    );
  }
}
