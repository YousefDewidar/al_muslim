import 'package:al_muslim/core/widgets/custom_app_bar.dart';
import 'package:al_muslim/core/widgets/space.dart';
import 'package:al_muslim/features/radio/views/widgets/custom_button.dart';
import 'package:al_muslim/features/radio/views/widgets/page_cover.dart';
import 'package:al_muslim/features/radio/views/widgets/play_card.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class RadioView extends StatefulWidget {
  final String url;
  final String sura;
  final String? image;
  final String reacterName;
  const RadioView({
    super.key,
    required this.url,
    this.image,
    this.sura = '',
    required this.reacterName,
  });

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
    player.setVolume(.8);
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
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const SpaceV(20),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: IconBack(
              col: Theme.of(context).textTheme.labelLarge!.color!,
            ),
          ),
          const Spacer(),
          PageCover(
            image: widget.image,
          ),
          const SpaceV(10),
          SizedBox(
            width: double.infinity,
            child: Text(
              textAlign: TextAlign.center,
              widget.sura.isEmpty ? '' : 'سورة ${widget.sura}',
              style:
                  Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 25),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Text(
              textAlign: TextAlign.center,
              widget.sura.isEmpty
                  ? 'إذاعة :${widget.reacterName.replaceAll('إذاعة', '')}'
                  : 'القارئ :${widget.reacterName.replaceAll('إذاعة', '')}',
              style:
                  Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 19),
            ),
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
                          color: Theme.of(context).textTheme.labelLarge!.color,
                        )
                      : Icon(
                          Icons.volume_up,
                          color: Theme.of(context).textTheme.labelLarge!.color,
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
          const Spacer(),
        ],
      ),
    );
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
