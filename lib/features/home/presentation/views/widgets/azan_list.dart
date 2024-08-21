
import 'package:al_muslim/features/home/data/model/azan_model.dart';
import 'package:al_muslim/features/home/presentation/views/widgets/salah_column.dart';
import 'package:flutter/material.dart';

class AzanList extends StatelessWidget {
  const AzanList({
    super.key,
    required this.azan,
  });

  final List<AzanModel> azan;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 20.0,
        horizontal: 20
      ),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * .1,
        width: MediaQuery.of(context).size.width * 1,
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return SalahColumn(azan: azan[index]);
          },
        ),
      ),
    );
  }
}
