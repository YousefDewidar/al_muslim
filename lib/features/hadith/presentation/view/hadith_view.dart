import 'package:al_muslim/core/widgets/icon_back.dart';
import 'package:al_muslim/features/hadith/presentation/view/widgets/hadith_view_body.dart';
import 'package:flutter/material.dart';

class HadithView extends StatelessWidget {
  const HadithView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          actions: const [IconBack()],
          centerTitle: true,
          title: Text(
            'الأحاديث',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        body: const HadithViewBody(),
      ),
    );
  }
}
