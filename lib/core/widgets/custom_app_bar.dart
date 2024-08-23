import 'package:al_muslim/core/widgets/space.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String header;
  final String desc;
  const CustomAppBar({
    super.key,
    required this.header,
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(40),
        bottomRight: Radius.circular(40),
      ),
      elevation: 3,
      shadowColor: Colors.orange.withOpacity(.6),
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            height: desc == ''
                ? MediaQuery.of(context).size.height * .09
                : MediaQuery.of(context).size.height * .13,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Theme.of(context).cardTheme.color!.withOpacity(.8),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                )),
            // Title
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      header,
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                desc == ''
                    ? const SpaceV(0)
                    : Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text(desc,
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(color: Colors.black45)),
                      ),
              ],
            ),
          ),
          // Icon Back
          Positioned(
            top: 10,
            right: 10,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                height: 37,
                width: 37,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10)),
                child: const Icon(
                  Icons.arrow_forward,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
