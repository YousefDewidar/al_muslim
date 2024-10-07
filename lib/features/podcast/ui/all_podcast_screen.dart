import 'package:al_muslim/core/utils/lists/podcast_image.dart';
import 'package:al_muslim/core/utils/models/podcast_data.dart';
import 'package:al_muslim/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import '../data/model/eh_elmoshkila_list.dart';
import '../data/wa3i_list.dart';
import 'podcast_episons_screen.dart';
import 'widgets/home_main_item.dart';

class AllPodcastsScreen extends StatelessWidget {
  const AllPodcastsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<List<PodcastData>> podcasts = [
      ehElmoshkilaVideos(),
      wa3iVideos(),
    ];
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const CustomAppBar(header: 'البودكاست', desc: ''),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: podcastImages().length,
              itemBuilder: (BuildContext context, int index) {
                return PodcastItem(
                  onTap: () => Navigator.push(
                    context,
                    PageTransition(
                        child: PodcastEpisonsScreen(
                          podcastData: podcasts[index],
                          podcastImages: podcastImages()[index].imageUrl,
                        ),
                        type: PageTransitionType.rightToLeft),
                  ),
                  imageUrl: podcastImages()[index].imageUrl,
                  color: Theme.of(context).textTheme.labelLarge!.color!,
                  height: 200,
                  width: 110,
                  radius: 20,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
