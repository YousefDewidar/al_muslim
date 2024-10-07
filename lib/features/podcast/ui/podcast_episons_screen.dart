import 'package:al_muslim/core/utils/models/podcast_data.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'video_player_screen.dart';

class PodcastEpisonsScreen extends StatelessWidget {
  final List<PodcastData> podcastData;
  final String podcastImages;
  const PodcastEpisonsScreen({
    super.key,
    required this.podcastData,
    required this.podcastImages,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: podcastData.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () => Navigator.push(
                context,
                PageTransition(
                    child: VideoPlayerScreen(
                      podcastData: podcastData[index],
                    ),
                    type: PageTransitionType.rightToLeft),
              ),
              child: SizedBox(
                height: 100,
                child: Row(
                  children: [
                    Expanded(
                        child: Text(
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .copyWith(
                                  fontSize: 19,
                                ),
                            textAlign: TextAlign.center,
                            podcastData[index].vidTitle)),
                    Image.network(
                      podcastImages,
                      width: 50,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
