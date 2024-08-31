import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

class NetworkCheck {
  static void  networkCheck(BuildContext context) {
    final materialBanner = MaterialBanner(
      elevation: 50000,
      backgroundColor: Colors.transparent,
      forceActionsBelow: true,
      content: AwesomeSnackbarContent(
        title: '  !انتبه',
        message: '  تأكد من اتصالك بالانتر نت واعد المحاولة',
        contentType: ContentType.warning,
        inMaterialBanner: true,
        titleFontSize: 22,
        messageFontSize: 19,
      ),
      actions: const [SizedBox.shrink()],
    );
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
