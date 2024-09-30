import 'package:al_muslim/core/widgets/isnside_noti.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
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
  bool bookMark = false;

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
    hasBookMark();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
        color: bookMark
            ? const Color.fromARGB(255, 28, 131, 215)
            : Colors.transparent,
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
