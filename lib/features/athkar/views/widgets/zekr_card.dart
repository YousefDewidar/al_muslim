import 'package:al_muslim/core/widgets/isnside_noti.dart';
import 'package:al_muslim/features/athkar/data/azkar_all_model.dart';
import 'package:al_muslim/features/favorites/presentation/view%20model/cubit/fav_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ZekrCard extends StatefulWidget {
  final AllAzkarModel azkar;
  const ZekrCard({super.key, required this.azkar});

  @override
  State<ZekrCard> createState() => _ZekrCardState();
}

class _ZekrCardState extends State<ZekrCard> {
  late int count;
  bool isFav = false;
  bool isFinshed = false;

  isFavMethod() async {
    isFav = await BlocProvider.of<FavCubit>(context).isFound(widget.azkar);
  }

  @override
  void initState() {
    count = widget.azkar.count;
    isFavMethod();
    super.initState();
  }

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
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontFamily: 'IBMPlex', height: 1.6),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 //fav button
                IconButton(
                  padding: const EdgeInsets.all(20),
                  color: Colors.teal,
                  onPressed: () {
                    if (!isFav) {
                      BlocProvider.of<FavCubit>(context).addToFav(widget.azkar);
                    } else {
                      BlocProvider.of<FavCubit>(context)
                          .removeFromFav(widget.azkar);
                    }
                    isFav = !isFav;
                    setState(() {});
                  },
                  icon: Icon(isFav ? Icons.favorite : Icons.favorite_outline,color: Colors.teal),
                ),
                //count button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: TextButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(Colors.teal),
                      shape: WidgetStateProperty.all(const CircleBorder()),
                      fixedSize: WidgetStateProperty.all(const Size(70, 70)),
                    ),
                    onPressed: () {
                      count--;
                      if (count == 0) {
                        isFinshed = true;
                      }
                      setState(() {});
                    },
                    child: Text(
                      isFinshed ? 'تم' : '$count',
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ),
                //shareButton
                IconButton(onPressed: () {
                  InsideNotification.shareMethod(
                          message: widget.azkar.text, context: context);
                }, icon: const Icon(Icons.share,color: Colors.teal,))
              ],
            ),
          ],
        ));
  }
}
