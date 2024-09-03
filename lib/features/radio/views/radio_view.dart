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
        title: Text('اهلا', style: Theme.of(context).textTheme.headlineSmall!),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          PageCover(
            image: widget.image,
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
                            setState(() {});
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
