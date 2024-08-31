import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ShareNotification {
  static void shareMethod(
      {required String message, required BuildContext context}) async {
    final res =
        await Share.share(message, subject: 'اكتشف تطبيق المسلم من هنا ');
    if (res.status == ShareResultStatus.success) {
      final materialBanner = MaterialBanner(
        elevation: 50000,
        backgroundColor: Colors.transparent,
        forceActionsBelow: true,
        content: AwesomeSnackbarContent(
          title: 'اشعار جديد',
          message: 'تم مشاركة الدعاء بنجاح',
          contentType: ContentType.success,
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
}
