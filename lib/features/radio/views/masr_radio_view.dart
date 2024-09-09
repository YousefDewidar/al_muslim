import 'package:al_muslim/core/widgets/space.dart';
import 'package:al_muslim/features/radio/views/widgets/custom_button.dart';
import 'package:al_muslim/features/radio/views/widgets/page_cover.dart';
import 'package:al_muslim/features/radio/views/widgets/play_card.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class RadioMasrView extends StatefulWidget {
  final String url;
  const RadioMasrView({
    super.key,
    required this.url,
  });

  @override
  State<RadioMasrView> createState() => _RadioMasrViewState();
}

class _RadioMasrViewState extends State<RadioMasrView> {
  late Future<String> future;
  double volumeLevel = .5;
  late AudioPlayer player;
  bool isPlayed = false;
  bool isVolumeClicked = false;

  @override
  void initState() {
    super.initState();
    player = AudioPlayer();
    player.setVolume(.8);
    player.setUrl(
      'https://n0d.radiojar.com/8s5u5tpdtwzuv?rj-ttl=5&rj-tok=AAABkbQKcI4ABaY4JFeSI-ZWgA',
    );
  }

  @override
  void dispose() {
    player.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_forward_ios))
          ],
          centerTitle: true,
          title: Text('راديو مصر ',
              style: Theme.of(context).textTheme.headlineSmall!),
        ),
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Column(
            children: [
              const PageCover(
                image:
                    'assets/images/—Pngtree—beautiful al quran kareem islamic_6848467.png',
              ),
              const SpaceV(100),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                      onPressed: () async {
                        isVolumeClicked = !isVolumeClicked;
                        volumeLevel = player.volume;
                        setState(() {});
                      },
                      icon: volumeLevel == 0.0
                          ? Icon(
                              Icons.volume_off,
                              color:
                                  Theme.of(context).textTheme.labelLarge!.color,
                            )
                          : Icon(
                              Icons.volume_up,
                              color:
                                  Theme.of(context).textTheme.labelLarge!.color,
                            )),
                  CustomButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.skip_previous_rounded,
                      color: Theme.of(context).textTheme.labelLarge!.color,
                    ),
                  ),
                  PlayCard(
                    isPlay: isPlayed,
                    onPressed: () async {
                      isPlayed = !isPlayed;
                      isPlayed ? player.play() : player.pause();
                      setState(() {});
                    },
                  ),
                  CustomButton(
                    icon: Icon(
                      Icons.skip_next_rounded,
                      color: Theme.of(context).textTheme.labelLarge!.color,
                    ),
                    onPressed: () {},
                  ),
                  CustomButton(
                    icon: Icon(
                      Icons.repeat_one,
                      size: 30,
                      color: Theme.of(context).textTheme.labelLarge!.color,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
              showVolumeController(),
              const SpaceV(25),
            ],
          ),
        ]));
  }

  Widget showVolumeController() {
    return isVolumeClicked
        ? Slider(
            activeColor: const Color.fromARGB(255, 187, 113, 48),
            max: 1,
            min: 0,
            value: volumeLevel,
            onChanged: (val) async {
              await player.setVolume(val);
              volumeLevel = val;
              setState(() {});
            })
        : const SizedBox();
  }
}
