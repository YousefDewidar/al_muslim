import 'package:al_muslim/core/widgets/space.dart';
import 'package:al_muslim/features/alquran/views/listen%20to%20quran/listen_quran_view.dart';
import 'package:al_muslim/features/alquran/views/readQuran/views/read_quran_view.dart';
import 'package:al_muslim/features/alquran/views/tafserQuran/views/tafser_view.dart';
import 'package:al_muslim/features/alquran/views/all_swar.dart';
import 'package:al_muslim/features/radio/views/radio_view.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class CustomTitleCard extends StatelessWidget {
  final String categorytTitle;
  final String? image;
  final String? pageName;
  final String? suraName;
  final String? reacterName;

  final String? swrahUrl;
  final String? url;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final int? startIndex;
  final int? pagestartIndex;
  final Function()? onPressed;

  const CustomTitleCard({
    super.key,
    required this.categorytTitle,
    this.prefixIcon,
    this.url,
    this.pageName,
    this.startIndex,
    this.pagestartIndex,
    this.suffixIcon,
    this.onPressed,
    this.swrahUrl,
    this.image,
    this.suraName,
    this.reacterName,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        switch (pageName) {
          case 'radio':
            Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.rightToLeft,
                child: RadioView(
                  url: url ?? '',
                  sura: '',
                  reacterName: reacterName ?? '',
                ),
              ),
            );

          case 'fehres':
            Navigator.push(
              context,
              PageTransition(
                  type: PageTransitionType.rightToLeft,
                  child: const AllSwarView(
                    pageRoute: 'readQuran',
                    reacterName: '',
                  )),
            );

          case 'tafser':
            Navigator.push(
              context,
              PageTransition(
                  type: PageTransitionType.rightToLeft,
                  child: const AllSwarView(
                    reacterName: '',
                    pageRoute: 'redingTafser',
                  )),
            );
          case 'redingTafser':
            Navigator.push(
              context,
              PageTransition(
                  type: PageTransitionType.rightToLeft,
                  child: TafserView(tafserstartIndex: pagestartIndex ?? 2)),
            );

          case 'listenQuran':
            Navigator.push(
              context,
              PageTransition(
                  type: PageTransitionType.rightToLeft,
                  child: const ListenQuranView()),
            );
          case 'listenToSwrah':
            Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.rightToLeft,
                child: RadioView(
                  url: swrahUrl ?? 'https://server6.mp3quran.net/akdr/001.mp3',
                  sura: suraName ?? '',
                  reacterName: reacterName ?? '',
                ),
              ),
            );

          case 'readQuran':
            Navigator.push(
              context,
              PageTransition(
                  type: PageTransitionType.rightToLeft,
                  child: ReadQuranView(requiredPage: pagestartIndex ?? 3)),
            );
          default:
        }
      },
      child: Container(
        color: Colors.transparent,
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
        child: Row(
          children: [
            IconButton(
              onPressed: onPressed,
              icon: Icon(
                suffixIcon ?? Icons.arrow_back_ios,
                color: Theme.of(context).textTheme.labelLarge!.color,
              ),
            ),
            const Spacer(),
            Container(
              constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * .65),
              child: Text(
                categorytTitle,
                textAlign: TextAlign.right,
                textDirection: TextDirection.rtl,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: Theme.of(context).textTheme.labelLarge!,
              ),
            ),
            const SpaceH(10),
            Icon(prefixIcon,
                color: Theme.of(context).textTheme.labelLarge!.color),
          ],
        ),
      ),
    );
  }
}
