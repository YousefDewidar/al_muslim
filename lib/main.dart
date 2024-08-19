import 'package:flutter/material.dart';

void main() {
  runApp(const AlMuslim());
}

class AlMuslim extends StatelessWidget {
  const AlMuslim({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'المسلم',
      theme: ThemeData(),
      home: const Scaffold(),
    );
  }
}
