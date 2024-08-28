import 'package:flutter/material.dart';

class ReadQuranViewBody extends StatelessWidget {
  const ReadQuranViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: 604,
      itemBuilder: (context, index) =>  Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.center,
              decoration:  const BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/images/all.png'),fit: BoxFit.none)
                          ),
                          child: const Text('lllllll'),
            ),
          ),
        ],
      ),
    );
  }
}
