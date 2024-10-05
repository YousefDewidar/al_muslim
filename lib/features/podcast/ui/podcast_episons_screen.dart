import 'package:al_muslim/core/utils/models/podcast_data.dart';
import 'package:flutter/material.dart';
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
                  MaterialPageRoute(
                    builder: (context) => VideoPlayerScreen(
                      podcastData: podcastData[index],
                    ),
                  )),
              child: SizedBox(
                height: 100,
                child: Row(
                  children: [
                    Expanded(
                        child: Text(
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
