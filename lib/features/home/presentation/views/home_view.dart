import 'package:al_muslim/clock.dart';
import 'package:al_muslim/features/home/presentation/views/widgets/azan_list.dart';
import 'package:al_muslim/features/home/presentation/views/widgets/body_content.dart';
import 'package:al_muslim/features/home/presentation/views/widgets/home_bg_image.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // String time = DateFormat('hh:mm').format(DateTime.now());
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Stack(
              children: [
                const HomeBgImage(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 100,
                        width: 100,
                        child: ClockView(),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        '12 صفر ',
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(color: Colors.white),
                      ),
                      const AzanList(),
                    ],
                  ),
                ),
              ],
            ),
            const BodyContent(),
          ],
        ),
      ),
    );
  }
}
