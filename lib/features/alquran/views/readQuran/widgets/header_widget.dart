import 'package:flutter/material.dart';
import 'package:quran/quran.dart';

class HeaderWidget extends StatelessWidget {
  final int pageIndex;
  const HeaderWidget({
    super.key, required this.pageIndex,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Stack(
        children: [
          Center(
            child: Image.asset(
              "assets/images/888-02.png",
              width: MediaQuery.of(context).size.width,
              height: 50,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.7, vertical: 7),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  textAlign: TextAlign.center,
                  'عدد اياتها \n ${getVerseCount(pageIndex+1)}',
                  style:  const TextStyle(
                      fontSize: 5, fontWeight:FontWeight.bold),
                ),
                Center(
                    child: RichText(
                        text: TextSpan(
                  text: ' ${getSurahNameArabic(pageIndex+1)}',

                  // textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontFamily: "arsura", fontSize: 22, color: Colors.black),
                ))),
                 Text(
                  'ترتيبها\n ${pageIndex+1}  ',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
