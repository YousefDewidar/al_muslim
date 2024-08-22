import 'package:al_muslim/core/utils/constants.dart';
import 'package:al_muslim/features/salah/presentation/view/sunah_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AlsunahCard extends StatelessWidget {
  const AlsunahCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {
        Get.to(() => const SunahView());
      },
      child: Card(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * .075,
          width: double.infinity,
          child: Center(
            child: Text(
              'السنن  الرواتب',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Constants.kBgColDark),
            ),
          ),
        ),
      ),
    );
  }
}
