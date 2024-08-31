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

  static void networkCheck(BuildContext context) {
    insideNotificationCard(
      context: context,
      content: '  تأكد من اتصالك بالانتر نت واعد المحاولة',
      contentType: ContentType.warning,
      title: '  !انتبه',
    );
  }

  static void insideNotificationCard(
      {required ContentType contentType,
      required BuildContext context,
      required String title,
      required String content}) {
    final materialBanner = MaterialBanner(
      elevation: 50000,
      backgroundColor: Colors.transparent,
      forceActionsBelow: true,
      content: AwesomeSnackbarContent(
        title: title,
        message: content,
        contentType: contentType,
        inMaterialBanner: true,
        titleFontSize: 22,
        messageFontSize: 19,
      ),
      actions: const [SizedBox.shrink()],
    );
    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context)
      ..hideCurrentMaterialBanner()
      ..showMaterialBanner(materialBanner);

    Future.delayed(
      const Duration(seconds: 3),
      () {
        ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
      },
    );
  }
}
