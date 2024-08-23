import 'package:al_muslim/core/widgets/space.dart';
import 'package:al_muslim/features/settings/presentation/view%20model/cubit/setting_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangeThemeCard extends StatefulWidget {
  const ChangeThemeCard({
    super.key,
  });

  @override
  State<ChangeThemeCard> createState() => _ChangeThemeCardState();
}

class _ChangeThemeCardState extends State<ChangeThemeCard> {
  static List<String> options = ['op1', 'op2', 'op3'];
  String curOption = options[2];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            curOption = options[0];
            BlocProvider.of<SettingCubit>(context)
                .setTheme(theme: ThemeMode.light);
            setState(() {});
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
            child: Row(
              children: [
                Radio(
                  value: options[0],
                  groupValue: curOption,
                  onChanged: (value) {},
                ),
                const Spacer(),
                Text(
                  'الوضع النهاري',
                  textDirection: TextDirection.rtl,
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(fontSize: 18),
                ),
                const SpaceH(15),
                const Icon(Icons.light_mode_outlined),
              ],
            ),
          ),
        ),
        const Divider(
          height: 0,
        ),
        InkWell(
          onTap: () {
            curOption = options[1];
            BlocProvider.of<SettingCubit>(context)
                .setTheme(theme: ThemeMode.dark);
            setState(() {});
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
            child: Row(
              children: [
                Radio(
                    value: options[1],
                    groupValue: curOption,
                    onChanged: (value) {}),
                const Spacer(),
                Text(
                  'الوضع الليلي',
                  textDirection: TextDirection.rtl,
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(fontSize: 18),
                ),
                const SpaceH(15),
                const Icon(Icons.dark_mode_outlined),
              ],
            ),
          ),
        ),
        const Divider(
          height: 0,
        ),
        InkWell(
          onTap: () {
            curOption = options[2];
            BlocProvider.of<SettingCubit>(context)
                .setTheme(theme: ThemeMode.system);
            setState(() {});
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
            child: Row(
              children: [
                Radio(
                    value: options[2],
                    groupValue: curOption,
                    onChanged: (value) {}),
                const Spacer(),
                Text(
                  'وضع النظام',
                  textDirection: TextDirection.rtl,
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(fontSize: 18),
                ),
                const SpaceH(15),
                const Icon(Icons.mobile_friendly),
              ],
            ),
          ),
        ),
        const Divider(
          height: 0,
        ),
      ],
    );
  }
}
