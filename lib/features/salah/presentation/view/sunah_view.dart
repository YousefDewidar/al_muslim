import 'package:al_muslim/core/widgets/icon_back.dart';
import 'package:al_muslim/features/salah/presentation/view/widgets/sunah_table.dart';
import 'package:flutter/material.dart';

class SunahView extends StatelessWidget {
  const SunahView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            const Positioned(
              top: 5,
              right: 5,
              child: IconBack(),
            ),
            const SunahTable(),
            Positioned(
              top: 390,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  textDirection: TextDirection.rtl,
                  'عن أم المؤمنين أم حبيبة رملة بنت أبي سفيان رضي الله\n عنهما، قالت: سمعت رسول الله - صلى الله عليه وسلم -\n يقول «ما من عبد مسلم يصلي لله تعالى كل يوم ثنتي \nعشرة ركعة تطوعا غير الفريضة، إلا بنى الله له بيتا في \nالجنة، أو إلا بني له بيت في الجنة» ',
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(fontSize: 20, height: 1.6),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
