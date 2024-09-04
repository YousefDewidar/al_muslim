import 'package:al_muslim/features/hadith/data/model/hadith_model.dart';
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
            const EdgeInsets.only(top: 20.0, bottom: 20, left: 20, right: 20),
        child: Text(
          hadith.hadith,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.labelLarge!.copyWith(height: 1.8,fontFamily: 'IBMPlex'),
        ),
      ),
    );
  }
}
