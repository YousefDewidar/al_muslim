import 'dart:developer';

import 'package:al_muslim/features/radio/views/widgets/custom_button.dart';
import 'package:al_muslim/features/radio/views/widgets/page_cover.dart';
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
  double volumeLevel = .1;
  late AudioPlayer player;
  bool isPlayed = false;
  bool isVolumeClicked = false;
  @override
  void initState() {
    super.initState();
    log(widget.url);
    player = AudioPlayer();
    player.setUrl('https://n0d.radiojar.com/8s5u5tpdtwzuv?rj-ttl=5&rj-tok=AAABkbQKcI4ABaY4JFeSI-ZWgA');
    //https://Qurango.net/radio/alzain_mohammad_ahmad
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
          const PageCover(
            image: 'assets/images/masrQuranKreem.png',
          ),
          const Spacer(),
          Container(
            height: 125,
            width: 300,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/wood.jpg'),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.white),
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomButton(
                          onPressed: () async {
                            isVolumeClicked = !isVolumeClicked;
                            setState(() {});
                          },
                          icon: volumeLevel == 0.0
                              ? const Icon(
                                  Icons.volume_off,
                                )
                              : const Icon(
                                  Icons.volume_up,
                                )),
                      CustomButton(
                        onPressed: () {},
                        icon: const Icon(Icons.skip_previous_rounded),
                      ),
                      CircleAvatar(
                        radius: 35,
                        backgroundColor:
                            const Color.fromARGB(255, 187, 113, 48),
                        child: CustomButton(
                          onPressed: () async {
                            isPlayed = !isPlayed;
                            isPlayed ? player.play() : player.pause();
                            setState(() async {});
                          },
                          icon: isPlayed
                              ? const Icon(
                                  Icons.pause,
                                  size: 35,
                                  color: Colors.white,
                                )
                              : const Icon(
                                  Icons.play_arrow,
                                  size: 35,
                                  color: Colors.white,
                                ),
                        ),
                      ),
                      CustomButton(
                        icon: const Icon(Icons.skip_next_rounded),
                        onPressed: () {},
                      ),
                      CustomButton(
                        icon: const Icon(Icons.repeat_one, size: 30),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                showVolumeController()
              ],
            ),
          ),
          const Spacer(),
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
