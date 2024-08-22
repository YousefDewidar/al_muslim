import 'package:al_muslim/features/sabha/presentation/views/all_azkar_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SebhaView extends StatefulWidget {
  const SebhaView({super.key});

  @override
  State<SebhaView> createState() => _SebhaViewState();
}

class _SebhaViewState extends State<SebhaView> {
  int count = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          count++;
          setState(() {});
        },
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.teal,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SafeArea(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.repeat,
                          size: 40,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          count = 0;
                          setState(() {});
                        },
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(()=> AllAzkarView(zekrCount: count ,));
                        },
                        child: SizedBox(
                            height: 50,
                            width: 50,
                            child:
                                Image.asset('assets/icons/prayer-beads.png')),
                      ),
                    ],
                  ),
                  Text(
                    'سبحان الله ',
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(100.0),
                    child: Text(
                      '$count',
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
