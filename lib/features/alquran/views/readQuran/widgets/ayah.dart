import 'package:al_muslim/core/widgets/isnside_noti.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
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
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () async {
        final bool isCon = await InternetConnectionChecker().hasConnection;
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
      },
      onDoubleTap: () async {
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
      },
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
                        )),
                  ]),
            ]),
          ),
        ),
      ),
    );
  }
}
