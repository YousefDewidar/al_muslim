import 'package:flutter/material.dart';
import 'package:quran/quran.dart';

class HeaderWidget extends StatelessWidget {
  final int pageIndex;
  const HeaderWidget({
    super.key,
    required this.pageIndex,
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
                Center(
                  child: RichText(
                    text: TextSpan(
                      text: ' ${getSurahNameArabic(pageIndex + 1)}',
                      style:  TextStyle(
                          fontFamily: "arsura",
                          fontSize: 22,
                          color: Theme.of(context).textTheme.labelLarge!.color,),
                    ),
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
