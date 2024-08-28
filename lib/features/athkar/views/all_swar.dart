import 'package:al_muslim/features/athkar/views/widgets/all_swar_body.dart';
import 'package:flutter/material.dart';

class AllSwarView extends StatelessWidget {
  final String? pageRoute;
  final String? swarUrl;
  const AllSwarView({
    super.key, this.pageRoute, this.swarUrl,
  });

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
          child: AllSwarViewBody(
        pageRoute: pageRoute??'listenToSwrah',
        swrahUrl: swarUrl,
      )),
    );
  }
}
