import 'package:al_muslim/core/utils/models/podcast_data.dart';
import 'package:flutter/material.dart';
import 'widgets/custom_button.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerScreen extends StatefulWidget {
  final PodcastData podcastData;
  const VideoPlayerScreen({super.key, required this.podcastData});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late bool isPlaying;
  bool isMuted = false;
  late String id;
  late YoutubePlayerController _controller;
  @override
  void initState() {
    setState(() {});
    id = YoutubePlayer.convertUrlToId(widget.podcastData.vidUrl)!;
    _controller = YoutubePlayerController(
      initialVideoId: id,
      flags: const YoutubePlayerFlags(
        //!change after
        hideControls: false,
        autoPlay: true,
        forceHD: false,
        controlsVisibleAtStart: true,
        mute: false,
      ),
    );
    isPlaying = _controller.value.isPlaying;
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: YoutubePlayerBuilder(
        builder: (_, player) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 0.0),
              child: Column(
                children: [
                  player,
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      textAlign: TextAlign.right,
                      widget.podcastData.vidTitle,
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const Spacer(),
                  const Divider(
                    height: 20,
                    thickness: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomButton(
                          child: Icon(
                            isMuted
                                ? Icons.volume_off_rounded
                                : Icons.volume_up_rounded,
                            size: 30,
                          ),
                          onTap: () {
                            isMuted = !isMuted;
                            setState(() {});
                            isMuted ? _controller.mute() : _controller.unMute();
                          },
                        ),
                        CustomButton(
                          child: const Icon(
                            Icons.keyboard_double_arrow_left_rounded,
                            size: 40,
                          ),
                          onTap: () {
                            _controller.seekTo(Duration(
                                seconds:
                                    _controller.value.position.inSeconds - 10));
                          },
                        ),
                        CustomButton(
                          onTap: () {
                            _controller.value.isPlaying
                                ? _controller.pause()
                                : _controller.play();
                            isPlaying = !isPlaying;
                            setState(() {});
                          },
                          child: CircleAvatar(
                            backgroundColor: Colors.grey[300],
                            radius: 40,
                            child: Icon(
                              !isPlaying ? Icons.play_arrow : Icons.pause,
                              size: 40,
                            ),
                          ),
                        ),
                        CustomButton(
                          child: const Icon(
                            Icons.keyboard_double_arrow_right_rounded,
                            size: 40,
                          ),
                          onTap: () {
                            _controller.seekTo(Duration(
                                seconds:
                                    _controller.value.position.inSeconds + 10));
                          },
                        ),
                        CustomButton(
                          child: const Icon(
                            Icons.fullscreen,
                            size: 30,
                          ),
                          onTap: () {
                            _controller.toggleFullScreenMode();
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        player: YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
          progressIndicatorColor: Colors.red,
          onReady: () {},
        ),
      ),
    );
  }
}
