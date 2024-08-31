import 'package:al_muslim/core/widgets/custom_app_bar.dart';
import 'package:al_muslim/features/alquran/data/model/all_model.dart';
import 'package:al_muslim/features/athkar/views/widgets/custom_title_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';

class QuranViewBody extends StatelessWidget {
  const QuranViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    List<AllModel> allAboutQuran = [
      AllModel(title: 'الفهرس', icon: Icons.book, routeName: 'fehres'),
      AllModel(
          title: 'استماع القران الكريم',
          icon: Icons.headphones_outlined,
          routeName: 'listenQuran'),
      AllModel(
          title: 'تفسير القران الكريم',
          icon: FontAwesomeIcons.book,
          routeName: 'tafser'),
    ];
    return Column(
      children: [
        const CustomAppBar(
          header: 'القران الكريم',
          desc: 'هنا ستجد كل ما يخص القران الكريم',
        ),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: allAboutQuran.length,
            itemBuilder: (BuildContext context, int index) {
              return CustomTitleCard(
                startIndex: index,
                pageName: allAboutQuran[index].routeName,
                categorytTitle: allAboutQuran[index].title,
                prefixIcon: allAboutQuran[index].icon,
              );
            },
          ),
        )
      ],
    );
  }
}
