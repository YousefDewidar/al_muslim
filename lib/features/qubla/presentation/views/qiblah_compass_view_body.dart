import 'dart:math';
import 'package:al_muslim/core/widgets/custom_app_bar.dart';
import 'package:al_muslim/core/widgets/space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';

class QuiblaViewBody extends StatefulWidget {
  const QuiblaViewBody({super.key});

  @override
  State<QuiblaViewBody> createState() => _QuiblaViewBodyState();
}

class _QuiblaViewBodyState extends State<QuiblaViewBody>
    with SingleTickerProviderStateMixin {
  Animation<double>? animation;
  AnimationController? _animationController;
  double begin = 0.0;
  double end = 0.0;
  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    animation = Tween(begin: 0.0, end: 0.0).animate(_animationController!);
    super.initState();
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const CustomAppBar(
            header: 'القبلة', desc: 'الاتجاه الدقيق لقبلة الصلاة'),
        const SizedBox(
          height: 10,
        ),
        StreamBuilder<QiblahDirection>(
            stream: FlutterQiblah.qiblahStream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final direction = snapshot.data;
                animation = Tween(
                        begin: begin,
                        end: (direction!.qiblah * (pi / 180) * -1))
                    .animate(_animationController!);
                begin = (direction.qiblah * (pi / 180) * -1);
                _animationController!.forward(from: 0);
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 60,
                      child: direction.direction.round() == 137
                          ? Image.asset('assets/images/landmark.png')
                          : Opacity(
                              opacity: 0.2,
                              child: Image.asset(
                                'assets/images/landmark.png',
                              )),
                    ),
                    Text(
                      '${direction.direction.round()}°',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(fontFamily: 'IBMPlex', fontSize: 42),
                    ),
                    SizedBox(
                      height: 300,
                      child: AnimatedBuilder(
                        animation: animation!,
                        builder: (context, child) {
                          return Transform.rotate(
                              angle: animation!.value,
                              child: Image.asset(
                                  'assets/images/compass_without_needel.png'));
                        },
                      ),
                    ),
                    Text(
                      'السهم يشير الى اتجاه القبلة دائما',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(fontFamily: 'IBMPlex', fontSize: 23),
                    ),
                    const SpaceV(5),
                    Text(
                      '  ∞ يجب التاكد من تدوير الهاتف قبل الاستخدام علي شكل  ',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontFamily: 'IBMPlex', fontWeight: FontWeight.bold),
                    ),
                    const SpaceV(5),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        textAlign: TextAlign.center,
                        'يشير السهم الي اتجاه القبله وللحصول علي نتيجه دقيقه حرك جهازك يمينا او يسارا بشكل دائري  واحرص علي ان يكون جهازك بعيد عن اي اجهزه الكترونيه او مجال مغناطيسي  حول الجهاز حتي لا يوثر علي دقة البوصلة',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(fontFamily: 'IBMPlex'),
                      ),
                    ),
                  ],
                );
              } else {
                return const Column(
                  children: [
                    SpaceV(50),
                    CircularProgressIndicator(color: Colors.amber),
                  ],
                );
              }
            }),
      ],
    );
  }
}
