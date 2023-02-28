// ignore_for_file: use_build_context_synchronously

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:penjual/data/impl/mycanteen_impl.dart';

class ProfileController extends ChangeNotifier {
  bool buka = false;

  final MyCanteenImpl _myCanteenImpl = MyCanteenImpl();
  void openClose(BuildContext context) async {
    buka = !buka;
    notifyListeners();

    final res = await _myCanteenImpl.openCantin(buka);
    res.fold((l) {
      buka = !buka;
      notifyListeners();
      final snackBar = SnackBar(
        /// need to set following properties for best effect of awesome_snackbar_content
        elevation: 0,
        // behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        content: AwesomeSnackbarContent(
          inMaterialBanner: true,
          title: 'Gagal!',
          message: l,

          /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
          contentType: ContentType.failure,
        ),
      );

      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);
    }, (r) {});
    Navigator.pop(context);
  }
}
