import 'package:al_muslim/core/widgets/icon_back.dart';
import 'package:al_muslim/core/widgets/space.dart';
import 'package:al_muslim/features/salah/presentation/view%20model/salah_services.dart';
import 'package:al_muslim/features/salah/presentation/view/widgets/alsunah_card.dart';
import 'package:al_muslim/features/salah/presentation/view/widgets/dat_row.dart';
import 'package:al_muslim/features/salah/presentation/view/widgets/location_card.dart';
import 'package:al_muslim/features/salah/presentation/view/widgets/salah_grid_view.dart';
import 'package:flutter/material.dart';

class SalahViewBody extends StatelessWidget {
  const SalahViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 30),
      child: FutureBuilder(
          future: SalahServices().getDayDataFormLDB(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: [
                  const SpaceV(15),
                  DayRow(dayData: snapshot.data!),
                  const SpaceV(16),
                  const LocationCard(),
                  SalahGridView(dayData: snapshot.data!),
                  const AlsunahCard(),
                ],
              );
            } else {
              return const Center(
                  child: CircularProgressIndicator(color: Colors.orange));
            }
          }),
    );
  }
}
