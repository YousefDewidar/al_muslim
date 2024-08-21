import 'package:al_muslim/features/home/data/model/azan_model.dart';
import 'package:flutter/material.dart';

class SalahColumn extends StatelessWidget {
  final AzanModel azan;
  const SalahColumn({
    super.key,
    required this.azan,
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
                .copyWith(color: Colors.white),
          ),
          Icon(azan.icon),
          Text(
            //?must change later
            azan.prayTime,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontWeight: FontWeight.bold,color: Colors.white),
          ),
        ],
      ),
    );
  }
}
