import 'package:al_muslim/core/helper/location.dart';
import 'package:al_muslim/features/athkar/data/azkar_services.dart';
import 'package:al_muslim/features/home/presentation/view%20model/azan_services.dart';
import 'package:al_muslim/features/salah/presentation/view%20model/salah_services.dart';
import 'package:flutter/material.dart';

class LandingView extends StatelessWidget {
  const LandingView({super.key});

  @override
  Widget build(BuildContext context) {
    // set data to local
    SalahServices().setDayData();
    PrayTimeServices().getPrayTime();
    AzkarServices().setAzkarAsString();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/landing_masged.png'),
            Text(
              'حدد موقعك ',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            Text(
              'من فضلك قم بادخال موقعك لضبط\n مواقيت الصلاه في مدينتك',
              style: Theme.of(context).textTheme.titleSmall,
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Location().requestPermission();
                  },
                  style: ButtonStyle(
                    shape: WidgetStateProperty.all(ContinuousRectangleBorder(
                        borderRadius: BorderRadius.circular(30))),
                  ),
                  child: Text(
                    'حدد موقعك ',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
