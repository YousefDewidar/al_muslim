import 'package:al_muslim/features/athkar/data/azkar_cateogry_model.dart';
import 'package:al_muslim/features/athkar/data/azkar_services.dart';
import 'package:al_muslim/features/athkar/views/widgets/zekr_category_card.dart';
import 'package:flutter/material.dart';

class ALlAzkarView extends StatefulWidget {
  const ALlAzkarView({super.key});

  @override
  State<ALlAzkarView> createState() => _ALlAzkarViewState();
}

class _ALlAzkarViewState extends State<ALlAzkarView> {
  late Future <List<AzkarCategoryModel>> future;
  @override
  void initState() {
    future = AzkarServices().getAllCategory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: future,
        builder: (conext, snapShot) {
          if (snapShot.hasData) {
            List<AzkarCategoryModel> category = snapShot.data!;
            return ListView.builder(
              itemCount: category.length,
              itemBuilder: (BuildContext context, int index) {
                return ZekrCategoryCard(
                  categoryName: category[index].category,
                  startIndex: index,
                );
              },
            );
          } else {
            return const Text('error');
          }
        },
      ),
    );
  }
}
