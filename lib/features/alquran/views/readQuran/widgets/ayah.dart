import 'dart:developer';
import 'package:al_muslim/core/widgets/isnside_noti.dart';
import 'package:al_muslim/features/alquran/data/model/tafser_model.dart';
import 'package:al_muslim/features/alquran/data/tafser_services.dart';
import 'package:al_muslim/features/alquran/views/readQuran/widgets/screen_shot_view.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reaction_button/flutter_reaction_button.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:just_audio/just_audio.dart';
import 'package:quran/quran.dart' as quran;
import 'package:shared_preferences/shared_preferences.dart';

class Ayah extends StatefulWidget {
  final int surahIndex;
  final int verseIndex;
  const Ayah({super.key, required this.surahIndex, required this.verseIndex});

  @override
  State<Ayah> createState() => _AyahState();
}

class _AyahState extends State<Ayah> {
  late AudioPlayer player;
  bool bookMark = false;
  bool playingAudio = false;
  bool isSharing = false;
  int indexx = 1;

  void hasBookMark() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (pref.containsKey('last_sura_num')) {
      if (pref.getInt('last_sura_num') == widget.surahIndex &&
          pref.getInt('last_aya_num') == widget.verseIndex) {
        bookMark = true;
      }
    }
  }

  @override
  void initState() {
    player = AudioPlayer();
    hasBookMark();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    player.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ReactionButton(
          onReactionChanged: (val) async {
            if (val?.value == 'play') {
              final bool isCon =
                  await InternetConnectionChecker().hasConnection;
              if (isCon) {
                playingAudio = true;
                setState(() {});
                final url = quran.getAudioURLByVerse(
                    widget.surahIndex + 1, widget.verseIndex + 1);
                final duration = await player.setUrl(url);
                player.play();
                Future.delayed(
                  duration ?? const Duration(milliseconds: 5),
                  () {
                    playingAudio = false;
                    setState(() {});
                  },
                );
              } else {
                InsideNotification.insideNotificationCard(
                    contentType: ContentType.warning,
                    context: context,
                    title: 'تأكد من اتصالك بالانترنت',
                    content: "للإستماع اللي الآية تأكد من اتصالك بالانترنت");
              }
            } else if (val?.value == 'bookMark') {
              SharedPreferences pref = await SharedPreferences.getInstance();
              if (bookMark) {
                pref.remove('last_aya_num');
                pref.remove('last_sura_num');
                bookMark = false;
              } else {
                pref.setInt('last_aya_num', widget.verseIndex);
                pref.setInt('last_sura_num', widget.surahIndex);
                bookMark = true;
                InsideNotification.insideNotificationCard(
                    contentType: ContentType.help,
                    context: context,
                    title: 'تم حفظ اخر موضع لك',
                    content: "",
                    time: 1);
              }
              setState(() {});
            } else if (val?.value == 'tafser') {
              final bool isCon =
                  await InternetConnectionChecker().hasConnection;
              if (isCon) {
                List<TafserModel> tafser = await TafserServices()
                    .fetchTafser(swrahNum: widget.surahIndex + 1);
                showModalBottomSheet(
                  backgroundColor: const Color.fromARGB(255, 33, 33, 33),
                  context: context,
                  builder: (context) {
                    return Container(
                      margin: const EdgeInsets.all(20),
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Text(
                        tafser[widget.verseIndex].ayahTafser,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                    );
                  },
                );
              } else {
                InsideNotification.insideNotificationCard(
                    contentType: ContentType.warning,
                    context: context,
                    title: 'تأكد من اتصالك بالانترنت',
                    content: "لقرائه التفسير تأكد من اتصالك بالانترنت");
              }
            } else if (val?.value == 'share') {
              showModalBottomSheet(
                showDragHandle: true,
                backgroundColor: const Color.fromARGB(255, 33, 33, 33),
                context: context,
                builder: (context) {
                  //? screen shot view...
                  return ScreenShotView(
                    suraIndex: widget.surahIndex,
                    suraName: quran.getSurahNameArabic(widget.surahIndex + 1),
                    ayah:
                        '${quran.getVerse(widget.surahIndex + 1, widget.verseIndex + 1).toString()}${quran.getVerseEndSymbol(widget.verseIndex + 1)}',
                  );
                },
              );
              setState(() {});
            }
          },
          reactions: const [
            Reaction(value: 'play', icon: Icon(Icons.play_arrow)),
            Reaction(value: 'bookMark', icon: Icon(Icons.bookmark)),
            Reaction(value: 'tafser', icon: Icon(Icons.menu_book_sharp)),
            Reaction(value: 'share', icon: Icon(Icons.share)),
          ],
          itemSize: const Size(100, 40),
          child: Container(
            decoration: BoxDecoration(
              border: playingAudio ? Border.all() : const Border(),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  bookMark
                      ? const Color.fromARGB(57, 28, 215, 103)
                      : Colors.transparent,
                  bookMark
                      ? const Color.fromARGB(41, 215, 193, 28)
                      : Colors.transparent,
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(children: [
                  // الايه
                  TextSpan(
                    text: quran
                        .getVerse(widget.surahIndex + 1, widget.verseIndex + 1)
                        .toString(),
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          height: 2,
                        ),
                    children: [
                      // رقم الايه
                      TextSpan(
                        text: quran.getVerseEndSymbol(widget.verseIndex + 1),
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ]),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
