import 'package:al_muslim/core/helper/location.dart';
import 'package:al_muslim/core/widgets/custom_app_bar.dart';
import 'package:al_muslim/core/widgets/space.dart';
import 'package:al_muslim/features/settings/presentation/view/widget/change_font_card.dart';
import 'package:al_muslim/features/settings/presentation/view/widget/change_theme_cards.dart';
import 'package:flutter/material.dart';


class SettingViewBody extends StatelessWidget {
  const SettingViewBody({super.key});

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const CustomAppBar(header: 'الإعدادات', desc: ''),
        const SpaceV(30),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            'المظهر',
            textDirection: TextDirection.rtl,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        const SpaceV(10),
        const Divider(height: 0),
        const ChangeThemeCard(),
        const SpaceV(30),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            'حجم الخط',
            textDirection: TextDirection.rtl,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        const ChangeFontCard(),
        const Spacer(),
        FutureBuilder(
            future: FinalLoc.getLoc(),
            builder: (context, snap) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Text(
                  textAlign: TextAlign.center,
                  snap.hasData
                      ? snap.data ?? 'فشل تحديد موقعك'
                      : 'جاري تحديد موقعك الحالي...',
                  textDirection: TextDirection.rtl,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              );
            }),
        const SpaceV(50),
      ],
    );
  }
}
