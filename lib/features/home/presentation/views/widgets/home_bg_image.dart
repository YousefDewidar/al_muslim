import 'package:al_muslim/core/utils/images_data.dart';
import 'package:flutter/material.dart';

class HomeBgImage extends StatelessWidget {
  const HomeBgImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image(
      height: MediaQuery.of(context).size.height * .3,
      width: double.infinity,
      image: const AssetImage(ImageData.kHomeBgImage),
      fit: BoxFit.cover,
    );
  }
}
