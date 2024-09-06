import 'package:al_muslim/core/helper/location.dart';
import 'package:al_muslim/core/notification/noti_service.dart';
import 'package:al_muslim/features/alquran/data/fehres_service.dart';
import 'package:al_muslim/features/athkar/data/azkar_services.dart';
import 'package:al_muslim/features/home/presentation/view%20model/azan_services.dart';
import 'package:al_muslim/features/home/presentation/views/home_view.dart';
import 'package:al_muslim/features/salah/presentation/view%20model/salah_services.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LandingView extends StatefulWidget {
  const LandingView({super.key});

  @override
  State<LandingView> createState() => _LandingViewState();
}

class _LandingViewState extends State<LandingView> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    if (!Location.hasPermision) {
      Location().enabelLocaion();
    }
    return Scaffold(
      backgroundColor: Colors.white,
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
                  onPressed: () async {
                    isLoading = true;
                    setState(() {});

                    //?
                    PrayTimeServices().getPrayTime();
                    SalahServices().setDayData();
                    AzkarServices().getAllCategory();
                    AzkarServices().getAllAzkarInfo(0);
                    FehresService().getAllSwar();
                    //?
                    Location().getPermision();

                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    prefs.setBool('hasSeenLandingPage', true);

                    Future.delayed(
                      const Duration(seconds: 5),
                      () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeView(),
                        ),
                      ),
                    );
                    await NotificationService.createNotification();
                  },
                  style: ButtonStyle(
                    shape: WidgetStateProperty.all(ContinuousRectangleBorder(
                        borderRadius: BorderRadius.circular(30))),
                  ),
                  child: isLoading
                      ? const Center(
                          child: CircularProgressIndicator(
                          color: Colors.white,
                        ))
                      : Text(
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
