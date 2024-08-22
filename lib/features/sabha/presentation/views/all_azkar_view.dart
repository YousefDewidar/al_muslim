import 'package:al_muslim/core/utils/strings.dart';
import 'package:flutter/material.dart';

class AllAzkarView extends StatelessWidget {
  final int zekrCount;
  const AllAzkarView({super.key, required this.zekrCount});

  @override
  Widget build(BuildContext context) {
    List<String> azkar =ConstStrings.azkar;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: ConstStrings.azkar.length,
                itemBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height * .1,
                    width: MediaQuery.of(context).size.width * .1,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context,azkar[index]);
                      },
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 25,
                                child: Text('$zekrCount'),
                              ),
                              Text(
                                azkar[index],
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
