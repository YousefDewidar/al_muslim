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
    PageController pageContorller = PageController(initialPage:requiredPage-1 );
    final screenSize = MediaQuery.of(context).size;
    final screenpadding = MediaQuery.of(context).padding;

    return Scaffold(
      body: PageView.builder(
        reverse: true,
          controller: pageContorller,
          itemBuilder: (context, surahIndex) {
            return Padding(
              padding: surahIndex == 0
                  ? EdgeInsets.only(top: screenpadding.top * 6)
                  : const EdgeInsets.all(16.0),
              child: Column(children: [
                HeaderWidget(
                  pageIndex: surahIndex,
                ),
                surahIndex == 0
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
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                                children: [
                                  TextSpan(
                                      text: quran
                                          .getVerseEndSymbol(verseIndex + 1),
                                      style: const TextStyle(fontSize: 20)),
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
          color: Colors.black,
          width: MediaQuery.of(context).size.width * .4,
        ),
      ),
    );
  }
}
