import 'package:al_muslim/features/hadith/data/model/hadith_model.dart';
import 'package:al_muslim/features/home/presentation/views/widgets/circule_acion_button.dart';
import 'package:flutter/material.dart';

class HadithCard extends StatelessWidget {
  final HadithModel hadith;
  const HadithCard({super.key, required this.hadith});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border.all(
            color:
                Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(.5),
          ),
          borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding:
            const EdgeInsets.only(top: 10.0, bottom: 20, left: 20, right: 20),
        child: Column(
          children: [
            CirculeActionButton(
              color: const Color.fromARGB(255, 233, 195, 154).withOpacity(.8),
              icon: Icons.camera,
              radius: 20,
            ),
            Text(
              hadith.hadith,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .copyWith(fontFamily: 'IBMPlex', fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
