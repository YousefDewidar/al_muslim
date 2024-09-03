import 'package:al_muslim/features/athkar/data/azkar_all_model.dart';
import 'package:al_muslim/features/athkar/data/azkar_services.dart';
import 'package:al_muslim/features/athkar/views/widgets/zekr_card.dart';
import 'package:flutter/material.dart';

class AzkarRead extends StatefulWidget {
  final int startIndex;
  final String zecrCategory;
  const AzkarRead({super.key, required this.startIndex, required this.zecrCategory});

  @override
  State<AzkarRead> createState() => _AzkarReadState();
}

class _AzkarReadState extends State<AzkarRead> {
  late Future<List<AllAzkarModel>> future;
  @override
  void initState() {
 future=AzkarServices().getAllAzkarInfo(widget.startIndex);
     super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title:  Text(widget.zecrCategory),
        ),
        body: FutureBuilder(
            future:future,
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
