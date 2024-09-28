import 'package:al_muslim/core/widgets/custom_app_bar.dart';
import 'package:al_muslim/features/sera/data/model/sera_lesson_model.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeView extends StatefulWidget {
  final SeraLessonModel seraLessonModel;
  const YoutubeView({super.key, required this.seraLessonModel});

  @override
  State<YoutubeView> createState() => _YoutubeViewState();
}

class _YoutubeViewState extends State<YoutubeView> {
  late YoutubePlayerController controller;

  @override
  void initState() {
    super.initState();
    String id =
        YoutubePlayer.convertUrlToId(widget.seraLessonModel.lessonLink)!;
    controller = YoutubePlayerController(
      initialVideoId: id,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            header: widget.seraLessonModel.lessonTitle,
            desc: '',
          ),
          YoutubePlayer(
            controller: controller,
            showVideoProgressIndicator: true,
            
          ),
        ],
      ),
    );
  }
}
