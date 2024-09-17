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
            if (snap.hasData) {
              return Text(
                textAlign: TextAlign.center,
                snap.data!,
                textDirection: TextDirection.rtl,
                style: Theme.of(context).textTheme.headlineMedium,
              );
            } else if (snap.connectionState == ConnectionState.waiting) {
              return Text(
                textAlign: TextAlign.center,
                'جاري تحديد موقعك الحالي...',
                textDirection: TextDirection.rtl,
                style: Theme.of(context).textTheme.headlineMedium,
              );
            } else {
              return Text(
                textAlign: TextAlign.center,
                'فشل تحديد موقعك',
                textDirection: TextDirection.rtl,
                style: Theme.of(context).textTheme.headlineMedium,
              );
            }
          },
        ),
        const SpaceV(25),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(text: '', children: [
            TextSpan(
                text: 'تم تطوير التطبيق بواسطه\n ',
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(fontSize: 20)),
            TextSpan(
                text: 'يوسف',
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(fontSize: 20)),
            const TextSpan(text: '   '),
            const TextSpan(
                text: '&',
                style: TextStyle(color: Colors.orange, fontSize: 25)),
            const TextSpan(text: '   '),
            TextSpan(
                text: 'سيد',
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(fontSize: 20)),
          ]),
        ),
        const SpaceV(50),
      ],
    );
  }
}
