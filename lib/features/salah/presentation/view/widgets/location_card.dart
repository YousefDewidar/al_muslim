import 'package:al_muslim/core/helper/location.dart';
import 'package:al_muslim/features/salah/presentation/view/widgets/remain_salah.dart';
import 'package:flutter/material.dart';

class LocationCard extends StatelessWidget {
  const LocationCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const ContinuousRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      )),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        height: MediaQuery.of(context).size.height * .17,
        width: double.infinity,
        child: Column(
          children: [
            FutureBuilder(
                future: FinalLoc.getLoc(),
                builder: (context, snapshot) {
                  return Text(
                    snapshot.hasData
                        ? snapshot.data ?? 'فشل تحديد موقعك'
                        : 'جاري تحديد موقعك الحالي',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: Color.fromARGB(182, 0, 0, 0)),
                  );
                }),
            const Divider(
              color: Color.fromARGB(22, 0, 0, 0),
              height: 20,
            ),
            const RemainSalah(),
          ],
        ),
      ),
    );
  }
}
