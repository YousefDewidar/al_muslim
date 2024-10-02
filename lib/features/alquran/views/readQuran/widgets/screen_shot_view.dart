import 'dart:typed_data';

import 'package:al_muslim/core/utils/images_data.dart';
import 'package:al_muslim/core/widgets/space.dart';
import 'package:al_muslim/features/alquran/views/readQuran/widgets/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:screenshot/screenshot.dart';

class ScreenShotView extends StatefulWidget {
  final String suraName;
  final int suraIndex;
  final String ayah;

  const ScreenShotView(
      {super.key,
      required this.suraName,
      required this.ayah,
      required this.suraIndex});

  @override
  State<ScreenShotView> createState() => _ScreenShotViewState();
}

class _ScreenShotViewState extends State<ScreenShotView> {
  ScreenshotController screenshotController = ScreenshotController();

  Future<void> saveImageToGallery() async {
    await _requestPermission();
    final Uint8List? image = await screenshotController.capture();
    if (image != null) {
      await ImageGallerySaver.saveImage(image, quality: 100);
      Navigator.pop(context);
    }
  }

  Future<void> _requestPermission() async {
    if (await Permission.storage.request().isGranted) {
    } else {
      await Permission.storage.request();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.camera,
              color: Color.fromARGB(183, 255, 255, 255),
              size: 30,
            ),
            const SpaceV(10),
            Screenshot(
              controller: screenshotController,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                color: const Color.fromARGB(36, 230, 162, 137),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SpaceV(10),
                    HeaderWidget(
                      pageIndex: widget.suraIndex,
                      forYousef: true,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      widget.ayah,
                      style: const TextStyle(
                        fontFamily: 'Traditional Arabic',
                        fontSize: 20,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    Image.asset(
                      ImageData.logo,
                      height: 40,
                    ),
                    const Text(
                      'بواسطة تطبيق المُسْلِم',
                      style: TextStyle(
                        fontFamily: 'Traditional Arabic',
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                    const SpaceV(10),
                  ],
                ),
              ),
            ),
            const SpaceV(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      color: Colors.redAccent,
                      child: const Text(
                        style: TextStyle(fontSize: 20),
                        'إلغاء',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                const SpaceH(5),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      saveImageToGallery();
                    },
                    child: Container(
                      color: Colors.greenAccent,
                      child: const Text(
                        'حفظ',
                        style: TextStyle(fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SpaceV(50),
          ],
        ),
      ),
    );
  }
}
