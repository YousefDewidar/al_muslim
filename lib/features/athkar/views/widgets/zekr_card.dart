import 'package:al_muslim/features/athkar/data/azkar_model.dart';
import 'package:al_muslim/features/favorites/presentation/view%20model/cubit/fav_cubit.dart';
import 'package:al_muslim/features/home/presentation/views/widgets/circule_acion_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class ZekrCard extends StatefulWidget {
  final AzkarModel azkar;
  bool isFavvvv;
  ZekrCard({super.key, required this.azkar, required this.isFavvvv});

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
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(height: 1.8),
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
                CirculeActionButton(
                  onPressed: () {
                    if (!widget.isFavvvv) {
                      BlocProvider.of<FavCubit>(context)
                          .addToFav(zekr: widget.azkar);
                      widget.isFavvvv = true;
                    } else {
                      BlocProvider.of<FavCubit>(context)
                          .removeFromFav(zekr: widget.azkar);
                      widget.isFavvvv = false;
                    }
                    setState(() {});
                  },
                  color: Colors.orange,
                  icon:
                      widget.isFavvvv ? Icons.favorite : Icons.favorite_outline,
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
