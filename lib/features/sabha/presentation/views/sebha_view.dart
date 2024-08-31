import 'package:al_muslim/core/widgets/custom_app_bar.dart';
import 'package:al_muslim/core/widgets/space.dart';
import 'package:al_muslim/features/sabha/presentation/views/all_azkar_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SebhaView extends StatefulWidget {
  const SebhaView({super.key, this.zkr = 'سبحان الله '});
  final String zkr;

  @override
  State<SebhaView> createState() => _SebhaViewState();
}

class _SebhaViewState extends State<SebhaView> {
  int count = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: InkWell(
          onTap: () {
            count++;
            setState(() {});
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomAppBar(
                  downloadButt: () {
                    count = 0;
                    setState(() {});
                  },
                  downloadIcon: Icons.repeat,
                  hasDownload: true,
                  header: 'السبحة',
                  desc: ''),
              Text(
                widget.zkr,
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                    color: Theme.of(context).textTheme.headlineSmall!.color!),
              ),
              Padding(
                padding: const EdgeInsets.all(100.0),
                child: Text(
                  '$count',
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(
                      color: Theme.of(context).textTheme.headlineSmall!.color!),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.off(() => const AllAzkarView());
                },
                child: SizedBox(
                  height: 100,
                  width: 100,
                  child: Image.asset('assets/icons/prayer-beads.png'),
                ),
              ),
              const SpaceV(20),
            ],
          ),
        ),
      ),
    );
  }
}
