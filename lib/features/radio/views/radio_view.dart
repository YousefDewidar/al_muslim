import 'dart:developer';

import 'package:al_muslim/features/radio/views/widgets/custom_button.dart';
import 'package:al_muslim/features/radio/views/widgets/page_cover.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class RadioView extends StatefulWidget {
  final String url;
  final String? image;
  const RadioView({super.key, required this.url, this.image});

  @override
  State<RadioView> createState() => _RadioViewState();
}

class _RadioViewState extends State<RadioView> {
  double volumeLevel = .1;
  late AudioPlayer player;
  bool isPlayed = false;
  bool isVolumeClicked = false;
  @override
  void initState() {
    super.initState();
    player = AudioPlayer();
    player.setUrl(widget.url);
  }

  @override
  void dispose() {
    player.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          PageCover(
            image: widget.image,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                  size: 30,
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
                  size: 30),
              CustomButton(
                size: 50,
                onPressed: () async {
                  isPlayed = !isPlayed;
                  isPlayed ? player.play() : player.pause();
                  setState(() {});
                },
                icon: isPlayed
                    ? const Icon(
                        Icons.pause,
                        size: 50,
                      )
                    : const Icon(
                        Icons.play_arrow,
                        size: 50,
                      ),
              ),
              CustomButton(
                icon: const Icon(Icons.skip_next_rounded),
                onPressed: () {},
                size: 30,
              ),
              CustomButton(
                icon: const Icon(Icons.repeat_one, size: 30),
                onPressed: () {},
                size: 30,
              ),
            ],
          ),
          showVolumeController()
        ],
      ),
    );
  }

  Widget showVolumeController() {
    return isVolumeClicked
        ? Slider(
            max: 1,
            min: 0,
            value: volumeLevel,
            onChanged: (val) async {
              await player.setVolume(val);
              volumeLevel = val;
              setState(() {});
              log(val.toString());
            })
        : const SizedBox();
  }
}
