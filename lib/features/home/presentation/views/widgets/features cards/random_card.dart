import 'package:al_muslim/core/widgets/share_notification.dart';
import 'package:al_muslim/core/widgets/space.dart';
import 'package:al_muslim/features/home/presentation/views/widgets/circule_acion_button.dart';
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
      height: MediaQuery.of(context).size.height * .21,
      width: MediaQuery.of(context).size.width * 1,
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CirculeActionButton(
                    color: const Color(0xff3d7085),
                    icon: Icons.replay,
                    radius: 20,
                    onTap: () {
                      ayah++;
                      if (ayah == ayat.length) {
                        ayah = 0;
                      }
                      setState(() {});
                    },
                  ),
                ),
                Text(
                  'رسالتك اليوميه',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CirculeActionButton(
                    onTap: () async {
                      ShareNotification.shareMethod(
                          message: ayat[ayah], context: context);
                    },
                    color: Colors.orange,
                    icon: Icons.share,
                    radius: 20,
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
