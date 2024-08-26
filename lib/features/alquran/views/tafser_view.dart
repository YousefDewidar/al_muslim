import 'package:al_muslim/features/alquran/views/widgets/tafser_view_body.dart';
import 'package:flutter/material.dart';

class TafserView extends StatelessWidget {
  const TafserView({super.key,});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: SafeArea(
          child: TafserViewBody(
      )),
    );
  }
}
