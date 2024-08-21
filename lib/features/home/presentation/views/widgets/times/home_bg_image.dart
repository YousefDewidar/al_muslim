import 'package:al_muslim/core/utils/strings.dart';
import 'package:al_muslim/core/widgets/space.dart';
import 'package:al_muslim/features/home/presentation/views/widgets/times/azan_list.dart';
import 'package:al_muslim/features/home/presentation/views/widgets/times/clock.dart';
import 'package:flutter/material.dart';

class HomeBgImage extends StatelessWidget {
  const HomeBgImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .3,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(ConstStrings.kHomeBgImage),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SpaceV(5),
          const SizedBox(
            height: 100,
            width: 100,
            child: ClockView(),
          ),
          const SpaceV(10),
          Text(
            '12 صفر ',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Colors.white),
          ),
          const SpaceV(10),
          const AzanList(),
        ],
      ),
    );
  }
}
