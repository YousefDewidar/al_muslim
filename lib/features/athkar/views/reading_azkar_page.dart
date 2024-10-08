import 'package:al_muslim/core/widgets/custom_app_bar.dart';
import 'package:al_muslim/features/athkar/data/azkar_all_model.dart';
import 'package:al_muslim/features/athkar/data/azkar_services.dart';
import 'package:al_muslim/features/athkar/views/widgets/zekr_card.dart';
import 'package:flutter/material.dart';

class AzkarRead extends StatefulWidget {
  final int startIndex;
  final String zecrCategory;
  const AzkarRead(
      {super.key, required this.startIndex, required this.zecrCategory});

  @override
  State<AzkarRead> createState() => _AzkarReadState();
}

class _AzkarReadState extends State<AzkarRead> {
  late Future<List<AllAzkarModel>> future;
  @override
  void initState() {
    future = AzkarServices().getAllInfoFromDB(widget.startIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child:
                  IconBack(col: Theme.of(context).textTheme.labelLarge!.color!),
            ),
          ],
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text(
            widget.zecrCategory,
            style: Theme.of(context)
                .textTheme
                .labelLarge!
                .copyWith(fontFamily: 'IBMPlex', height: 1.6),
          ),
        ),
        body: FutureBuilder(
            future: future,
            builder: (context, snapShot) {
              if (snapShot.hasData) {
                return ListView.builder(
                  itemCount: snapShot.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ZekrCard(
                      azkar: snapShot.data![index],
                    );
                  },
                );
              } else {
                return const Text('');
              }
            }));
  }
}
