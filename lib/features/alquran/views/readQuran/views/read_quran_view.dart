import 'package:al_muslim/core/widgets/custom_app_bar.dart';
import 'package:al_muslim/core/widgets/space.dart';
import 'package:al_muslim/features/alquran/views/readQuran/widgets/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:quran/quran.dart' as quran;

class ReadQuranView extends StatelessWidget {
  final int requiredPage;
  const ReadQuranView({
    super.key,
    required this.requiredPage,
  });

  @override
  Widget build(BuildContext context) {
    PageController pageContorller =
        PageController(initialPage: requiredPage - 1);
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: PageView.builder(
          reverse: true,
          controller: pageContorller,
          itemBuilder: (context, surahIndex) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child:
                  Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0, top: 20),
                  child: IconBack(
                    col: Theme.of(context).textTheme.labelLarge!.color!,
                  ),
                ),
                const SpaceV(20),
                HeaderWidget(
                  pageIndex: surahIndex,
                ),
                surahIndex == 0 || surahIndex == 8
                    ? const SizedBox()
                    : Basmalah(screenSize: screenSize),
                Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) => const Divider(),
                    itemCount: quran.getVerseCount(surahIndex + 1),
                    itemBuilder: (BuildContext context, int verseIndex) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(children: [
                            TextSpan(
                                text: quran
                                    .getVerse(surahIndex + 1, verseIndex + 1)
                                    .toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge!
                                    .copyWith(
                                      height: 2,
                                    ),
                                children: [
                                  TextSpan(
                                      text: quran
                                          .getVerseEndSymbol(verseIndex + 1),
                                      style: const TextStyle(
                                        fontSize: 20,
                                      )),
                                ]),
                          ]),
                        ),
                      );
                    },
                  ),
                ),
              ]),
            );
          }),
    );
  }
}

class Basmalah extends StatelessWidget {
  const Basmalah({
    super.key,
    required this.screenSize,
  });

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenSize.width,
      child: Padding(
        padding: EdgeInsets.only(
            left: (screenSize.width * .2),
            right: (screenSize.width * .2),
            top: 8,
            bottom: 2),
        child: Image.asset(
          "assets/images/Basmala.png",
          color: Theme.of(context).textTheme.labelLarge!.color,
          width: MediaQuery.of(context).size.width * .4,
        ),
      ),
    );
  }
}
