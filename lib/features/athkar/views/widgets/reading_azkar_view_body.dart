import 'package:al_muslim/features/athkar/data/azkar_model.dart';
import 'package:al_muslim/features/athkar/data/azkar_services.dart';
import 'package:al_muslim/core/widgets/custom_app_bar.dart';
import 'package:al_muslim/features/home/presentation/views/widgets/circule_acion_button.dart';
import 'package:flutter/material.dart';

class ReadingAzkarViewBody extends StatelessWidget {
  const ReadingAzkarViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<AzkarModel>>(
        future: AzkarServices().getAzkar(),
        builder: (context, snapShot) {
          if (snapShot.hasData) {
            List<AzkarModel> azkar = snapShot.data!;
            return Column(
              children: [
                CustomAppBar(
                  header: azkar[0].category,
                  desc: 'تعزز السكينه والطمانينه ف القلب ',
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: azkar.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ZekrCard(azkar: azkar[index]);
                    },
                  ),
                ),
              ],
            );
          } else {
            return const Text('');
          }
        });
  }
}

class ZekrCard extends StatefulWidget {
  final AzkarModel azkar;
  const ZekrCard({super.key, required this.azkar});

  @override
  State<ZekrCard> createState() => _ZekrCardState();
}

class _ZekrCardState extends State<ZekrCard> {
  bool isFinished = false;
  int count = 0;
  @override
  void initState() {
    count = widget.azkar.count;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        count--;
        if (count == 0) {
          isFinished = true;
        }
        setState(() {});
      },
      child: Container(
        margin: const EdgeInsets.all(20),
        width: double.infinity,
        decoration: BoxDecoration(
            border: Border.all(), borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                widget.azkar.text,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.labelLarge!.copyWith(height: 1.8),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CirculeActionButton(
                  color: Colors.orange,
                  icon: Icons.share,
                  radius: 20,
                ),
                Container(
                  alignment: Alignment.center,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(40)),
                  child: Text(
                    isFinished ? 'تم' : '$count',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
                const CirculeActionButton(
                  color: Colors.orange,
                  icon: Icons.headphones,
                  radius: 20,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
