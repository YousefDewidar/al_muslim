import 'package:al_muslim/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SalahItem extends StatelessWidget {
  const SalahItem({
    super.key,
    required this.title,
    required this.time,
  });
  final String title;
  final String time;

  @override
  Widget build(BuildContext context) {
    String time12() {
      DateTime timesss = DateFormat("HH:mm").parse(time);

      String time12 = DateFormat("hh:mm a").format(timesss);

      String time12Arabic = time12.replaceAll("AM", "ص").replaceAll("PM", "م");

      return time12Arabic;
    }

    return Card(
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Stack(
          alignment: Alignment.center,
          children: [
            const Positioned(
                top: 0,
                left: 0,
                child: Icon(
                  Icons.notifications_none_outlined,
                  color: Colors.orange,
                  size: 20,
                )),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Constants.kBgColDark),
                ),
                Text(
                  time12(),
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 23,
                      color: Constants.kBgColDark),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
