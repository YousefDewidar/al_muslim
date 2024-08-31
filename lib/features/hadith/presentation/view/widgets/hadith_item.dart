import 'package:al_muslim/core/storage/storage_service.dart';
import 'package:al_muslim/core/widgets/isnside_noti.dart';
import 'package:al_muslim/core/widgets/space.dart';
import 'package:al_muslim/features/hadith/presentation/view/reading_hadith_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class HadithItem extends StatelessWidget {
  const HadithItem({
    super.key,
    required this.image,
    required this.title,
    required this.sahehName,
  });
  final String image;
  final String title;
  final String sahehName;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () async {
        bool isConnected = await InternetConnectionChecker().hasConnection;
        bool downloaded = await StorageService.hasDataInLDB(key: sahehName);
        if (isConnected || downloaded) {
          Get.to(() => ReadingHadithView(sahehName: sahehName, title: title));
        } else {
          // ignore: use_build_context_synchronously
          InsideNotification.networkCheck(context);
        }
      },
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
                color: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .color!
                    .withOpacity(.4)),
            borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
          child: Column(
            children: [
              Container(
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(6)),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(image),
                  ),
                ),
              ),
              const SpaceV(8),
              Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontSize: 15),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
