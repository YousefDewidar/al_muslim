import 'package:al_muslim/core/utils/constants.dart';
import 'package:al_muslim/features/settings/presentation/view%20model/cubit/setting_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChangeFontCard extends StatefulWidget {
  const ChangeFontCard({
    super.key,
  });

  @override
  State<ChangeFontCard> createState() => _ChangeFontCardState();
}

class _ChangeFontCardState extends State<ChangeFontCard> {
  static double size = 20;
  double val = size;

  @override
  void initState() {
    initialDataFromLDB();
    super.initState();
  }

  void initialDataFromLDB() async {
    SharedPreferences asyncPref = await SharedPreferences.getInstance();

    if (asyncPref.getDouble('font') != null) {
      size = asyncPref.getDouble('font')!;
      val = size;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .2,
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 40,
                child: Text(
                  textAlign: TextAlign.center,
                  'بسم الله الرحمن الرحيم',
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      fontFamily: 'IBMPlex',
                      fontSize: size,
                      color: Colors.black),
                ),
              ),
              Slider(
                inactiveColor: Constants.kBgColDark,
                activeColor: Colors.purple,
                max: 27,
                min: 19,
                value: val,
                onChanged: (v) {
                  BlocProvider.of<SettingCubit>(context).setFont(font: v);
                  size = v;
                  val = v;
                  setState(() {});
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
