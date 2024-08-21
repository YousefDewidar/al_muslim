import 'package:flutter/material.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';

class RoutineTrackCard extends StatelessWidget {
  const RoutineTrackCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Card(
        child: Container(
          height: MediaQuery.of(context).size.width / 5,
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'الروتين اليومي',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 10, left: 10, top: 30),
                  child: LinearProgressBar(
                    borderRadius: BorderRadius.circular(20),
                    progressType: LinearProgressBar.progressTypeLinear,
                    progressColor: Colors.orange,
                    backgroundColor: Colors.white,
                    minHeight: 10,
                    maxSteps: 9,
                    currentStep: 1,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
