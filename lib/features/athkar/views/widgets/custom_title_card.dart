import 'package:al_muslim/core/widgets/network_check_card.dart';
import 'package:al_muslim/core/widgets/space.dart';
import 'package:al_muslim/features/alquran/views/listen%20to%20quran/listen_quran_view.dart';
import 'package:al_muslim/features/alquran/views/tafser_view.dart';
import 'package:al_muslim/features/athkar/views/all_swar.dart';
import 'package:al_muslim/features/athkar/views/reading_azkar_view.dart';
import 'package:al_muslim/features/home/presentation/views/home_view.dart';
import 'package:al_muslim/features/radio/views/radio_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class CustomTitleCard extends StatelessWidget {
  final String categorytTitle;
  final String? image;
  final String? pageName;
  final String? swrahUrl;
  final String? url;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final int? startIndex;
  final int? tafserstartIndex;
  final Function()? onPressed;

  const CustomTitleCard({
    super.key,
    required this.categorytTitle,
    this.prefixIcon,
    this.url,
    this.pageName,
    this.startIndex,
    this.tafserstartIndex,
    this.suffixIcon,
    this.onPressed,
    this.swrahUrl,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 30),
      child: GestureDetector(
        onTap: () {
          switch (pageName) {
            case 'redingAzkar':
              Get.to(() => ReadingAzkarView(
                    startIndex: startIndex ?? 0,
                  ));
            case 'radio':
              Get.to(() => RadioView(url: url ?? ''));
            case 'fehres':
              //!!!!!!!!!!!!!!!will change with all swar view
              Get.to(() => const HomeView());
            case 'tafser':
              checkNet(
                context,
                const AllSwarView(
                  pageRoute: 'redingTafser',
                ),
              );
            case 'redingTafser':
              checkNet(
                  context, TafserView(tafserstartIndex: tafserstartIndex ?? 2));

            case 'listenQuran':
              checkNet(context, const ListenQuranView());
            case 'listenToSwrah':
              Get.to(() => RadioView(
                    url:
                        swrahUrl ?? 'https://server6.mp3quran.net/akdr/001.mp3',
                  ));
            default:
          }
        },
        child: Row(
          children: [
            IconButton(
              onPressed: onPressed,
              icon: Icon(
                suffixIcon ?? Icons.arrow_back_ios,
                color: Colors.black,
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
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            const SpaceH(8),
            Icon(
              prefixIcon,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }

  void checkNet(context, Widget page) async {
    bool isConnected = await InternetConnectionChecker().hasConnection;
    if (isConnected) {
      Get.to(() => page);
    } else {
      // ignore: use_build_context_synchronously
      NetworkCheck.networkCheck(context);
    }
  }
}
