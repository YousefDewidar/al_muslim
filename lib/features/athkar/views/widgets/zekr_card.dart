import 'package:al_muslim/features/athkar/data/azkar_all_model.dart';
import 'package:flutter/material.dart';

class ZekrCard extends StatefulWidget {
  final AllAzkarModel azkar;
  const ZekrCard({super.key, required this.azkar});

  @override
  State<ZekrCard> createState() => _ZekrCardState();
}

class _ZekrCardState extends State<ZekrCard> {
  bool isFav = false;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: const BorderRadius.all(Radius.circular(16))),
        child: Column(
          children: [
            Text(
              widget.azkar.text,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 15),
            ),
            CircleAvatar(
              child: Text(widget.azkar.count.toString()),
            ),
            IconButton(
                padding: const EdgeInsets.all(20),
                color: Colors.amber,
                onPressed: () {
                  isFav = !isFav;
                  setState(() {});
                },
                icon: Icon(isFav ? Icons.favorite : Icons.favorite_outline))
          ],
        ));
  }
}
