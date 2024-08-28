import 'package:al_muslim/features/home/data/model/azan_model.dart';
import 'package:flutter/material.dart';

class SalahColumn extends StatelessWidget {
  final AzanModel azan;
  final Color iconCol;
  const SalahColumn({
    super.key,
    required this.azan,
    this.iconCol = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: [
          Text(
            azan.title,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: iconCol),
          ),
          Icon(azan.icon, color: iconCol),
          Text(
            //?must change later
            azan.prayTime,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontWeight: FontWeight.bold, color: iconCol),
          ),
        ],
      ),
    );
  }
}
