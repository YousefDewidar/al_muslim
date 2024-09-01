import 'package:al_muslim/core/utils/strings.dart';
import 'package:al_muslim/features/sabha/presentation/views/sebha_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class AllAzkarView extends StatelessWidget {
  const AllAzkarView({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> azkar = ConstStrings.azkar;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'اختر الذكر',
          style: Theme.of(context).textTheme.headlineSmall!,
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        actions: [
          IconButton(
            iconSize: 20,
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_forward_ios_rounded),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Expanded(
          child: ListView.builder(
            itemCount: ConstStrings.azkar.length,
            itemBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: MediaQuery.of(context).size.height * .1,
                width: MediaQuery.of(context).size.width * .1,
                child: GestureDetector(
                  onTap: () {
                    Get.off(() => SebhaView(zkr: azkar[index]));
                  },
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            textDirection: TextDirection.rtl,
                            azkar[index],
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
