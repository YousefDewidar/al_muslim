import 'package:al_muslim/core/widgets/space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';

class FeatureCard extends StatelessWidget {
  const FeatureCard({
    super.key,
    required this.title,
    this.imagePath,
    required this.navigateTo,
  });
  final String title;
  final String? imagePath;
  final Widget navigateTo;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {
        Navigator.push(
          context,
          PageTransition(
              type: PageTransitionType.rightToLeft, child: navigateTo),
        );
      },
      child: Card(
        child: Container(
          width: MediaQuery.of(context).size.width / 4.w - 20.w,
          height: MediaQuery.of(context).size.height / 10.5.h,
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 5.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              imagePath == null
                  ? const SizedBox()
                  : Image.asset(imagePath!, width: 30.w, height: 30.h),
              const SpaceV(5),
              Text(title,
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(fontWeight: FontWeight.w600, fontSize: 14.sp)),
            ],
          ),
        ),
      ),
    );
  }
}
