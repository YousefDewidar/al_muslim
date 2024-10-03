import 'package:al_muslim/core/widgets/space.dart';
import 'package:flutter/material.dart';
import 'package:quran/quran.dart' as quran;

class SuraInfoButton extends StatelessWidget {
  final int suraNum;
  const SuraInfoButton({
    super.key,
    required this.suraNum,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: IconButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return Column(
                children: [
                  const SpaceV(30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustomTextForButtomModel(
                        title: quran.getSurahName(suraNum),
                      ),
                      CustomTextForButtomModel(
                        title: quran.getSurahNameArabic(suraNum),
                      ),
                    ],
                  ),
                  const SpaceV(30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomTextForButtomModel(
                        title: quran.getVerseCount(suraNum).toString(),
                      ),
                      const CustomTextForButtomModel(title: ' :عدد الآيات')
                    ],
                  ),
                  const SpaceV(30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomTextForButtomModel(
                        title: quran.getSurahPages(suraNum).length.toString(),
                      ),
                      const CustomTextForButtomModel(title: ' :عدد الصفحات')
                    ],
                  ),
                  const SpaceV(30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomTextForButtomModel(
                        title: quran
                            .getPlaceOfRevelation(suraNum)
                            .toString()
                            .replaceAll('Makkah', 'مكة')
                            .replaceAll('Madinah', 'المدينة'),
                      ),
                      const CustomTextForButtomModel(title: ' :مكان النزول')
                    ],
                  ),
                ],
              );
            },
          );
        },
        iconSize: 30,
        icon: const Icon(Icons.info_outline, color: Colors.orange),
      ),
    );
  }
}

class CustomTextForButtomModel extends StatelessWidget {
  final String title;
  const CustomTextForButtomModel({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.labelLarge!.copyWith(fontSize: 23),
    );
  }
}
