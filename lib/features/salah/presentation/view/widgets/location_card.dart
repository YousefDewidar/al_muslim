import 'package:al_muslim/core/utils/constants.dart';
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
            const Text(
              'قطور',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Color(0xCEFFFFFF)),
            ),
            const Divider(
              color: Color.fromARGB(22, 0, 0, 0),
              height: 20,
            ),
            Text(
              'صلاة الفجر بعد',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 23,
                  color: Constants.kBgColDark),
            ),
            Text(
              '4:35:45',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  letterSpacing: 2,
                  color: Constants.kBgColDark,
                  fontFamily: AutofillHints.creditCardExpirationDate),
            ),
          ],
        ),
      ),
    );
  }
}
