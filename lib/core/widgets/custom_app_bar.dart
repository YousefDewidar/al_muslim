import 'package:al_muslim/core/widgets/space.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String header;
  final String desc;
  final bool hasDownload;
  final IconData downloadIcon;
  final void Function()? downloadButt;
  const CustomAppBar({
    super.key,
    required this.header,
    required this.desc,
    this.downloadButt,
    this.hasDownload = false,
    this.downloadIcon = Icons.download_for_offline_outlined,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 25),
      height: desc == ''
          ? MediaQuery.of(context).size.height * .13
          : MediaQuery.of(context).size.height * .13,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).cardTheme.color!.withOpacity(.8),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Stack(
          textDirection: TextDirection.rtl,
          alignment: Alignment.center,
          children: [
            hasDownload
                ? Positioned(
                    top: 15,
                    left: 10,
                    child: GestureDetector(
                      onTap: downloadButt,
                      child: Icon(
                        size: 41,
                        downloadIcon,
                        color: const Color.fromARGB(172, 0, 0, 0),
                      ),
                    ),
                  )
                : const SpaceH(30),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * .62),
                  child: Text(
                    header,
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        fontWeight: FontWeight.bold, height: 1.5, fontSize: 30),
                    textDirection: TextDirection.rtl,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                desc == ''
                    ? const SpaceV(0)
                    : Text(
                        desc,
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(color: Colors.black45),
                      ),
              ],
            ),
            const Positioned(right: 10, top: 15, child: IconBack()),
          ],
        ),
      ),
    );
  }
}

class IconBack extends StatelessWidget {
  const IconBack({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
    );
  }
}
