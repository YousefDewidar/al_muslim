import 'package:al_muslim/core/widgets/custom_app_bar.dart';
import 'package:al_muslim/core/widgets/space.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class InsideNotification {
  static void shareMethod(
      {required String message, required BuildContext context}) async {
    final res =
        await Share.share(message, subject: 'اكتشف تطبيق المسلم من هنا ');
    if (res.status == ShareResultStatus.success) {
      InsideNotification.insideNotificationCard(
        content: 'تم مشاركة الدعاء بنجاح',
        // ignore: use_build_context_synchronously
        context: context,
        title: 'اشعار جديد',
        contentType: ContentType.success,
      );
    }
  }

  static void insideNotificationCard(
      {required ContentType contentType,
      required BuildContext context,
      required String title,
      required String content,
      int time = 3}) {
    final materialBanner = MaterialBanner(
      elevation: 50000,
      backgroundColor: Colors.transparent,
      forceActionsBelow: true,
      content: AwesomeSnackbarContent(
        title: title,
        message: content,
        contentType: contentType,
        inMaterialBanner: true,
        titleTextStyle: const TextStyle(fontSize: 22),
        messageTextStyle: const TextStyle(fontSize: 19),
      ),
      actions: const [SizedBox.shrink()],
    );
    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context)
      ..hideCurrentMaterialBanner()
      ..showMaterialBanner(materialBanner);

    Future.delayed(
      Duration(seconds: time),
      () {
        ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
      },
    );
  }
}

class CheakNetworkWidget extends StatelessWidget {
  const CheakNetworkWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SpaceV(40),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 160),
          child: IconBack(col: Theme.of(context).textTheme.labelLarge!.color!),
        ),
        const Spacer(),
        const Text('🛜',
            style: TextStyle(fontSize: 25), textAlign: TextAlign.center),
        const SpaceV(10),
        Text('تأكد من اتصالك بالانترنت واعد المحاولة',
            style: Theme.of(context).textTheme.labelLarge,
            textAlign: TextAlign.center),
        const Spacer(),
      ],
    );
  }
}
