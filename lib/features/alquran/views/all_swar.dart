import 'package:al_muslim/features/alquran/views/widgets/all_swar_body.dart';
import 'package:flutter/material.dart';

class AllSwarView extends StatelessWidget {
  final String? pageRoute;
  final String? swarUrl;
  final String? reacterName;
  const AllSwarView({
    super.key, this.pageRoute, this.swarUrl, this.reacterName,
  });

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: AllSwarViewBody(
              pageRoute: pageRoute??'listenToSwrah',
              swrahUrl: swarUrl, reacterName:reacterName! ,
            ),
    );
  }
}
