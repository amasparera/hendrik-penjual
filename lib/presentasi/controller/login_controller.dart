import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:penjual/const/main_app.dart';

import '../../const/local_data.dart';
import '../../const/navigasi.dart';
import '../../const/request_datate.dart';
import '../../data/impl/auth_impl.dart';
import '../page/home_view.dart';
import '../page/login_view.dart';

class LoginController extends ChangeNotifier {
  bool isLogin = false;
  bool visibiliti = true;
  bool visibilitiAturUlang = true;
  bool openPass = false;
  bool openPass2 = false;
  bool sama = false;

  final AuthImpl authImpl = AuthImpl();

  RequestState reqLogin = RequestState.empty;
  late TextEditingController emailLogin;
  late TextEditingController passwordLogin;

  RequestState reqLupaPassword = RequestState.empty;
  late TextEditingController emailLupaPassword;

  bool hasMinLength = false;
  bool hasUppercase = false;
  bool hasSpecialCharacters = false;
  bool hasDigits = false;

  bool hasMinLength2 = false;
  bool hasUppercase2 = false;
  bool hasSpecialCharacters2 = false;
  bool hasDigits2 = false;
  String pesanView = "";

  RequestState reqKirimUlang = RequestState.empty;
  TextEditingController aturUlangSandi = TextEditingController();
  TextEditingController aturUlangSandi2 = TextEditingController();

  void readPass2() {
    if (aturUlangSandi.text.isNotEmpty) {
      openPass2 = true;
      notifyListeners();
    } else if (aturUlangSandi.text.isEmpty) {
      openPass2 = false;
      notifyListeners();
    }

    hasUppercase2 = aturUlangSandi.text.contains(RegExp(r'[A-Z]'));
    hasDigits2 = aturUlangSandi.text.contains(RegExp(r'[0-9]'));
    // bool hasLowercase = aturUlangSandi.text.contains(new RegExp(r'[a-z]'));
    hasSpecialCharacters2 =
        aturUlangSandi.text.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
    hasMinLength2 = aturUlangSandi.text.length > 7;
    notifyListeners();
  }

  void sandiSama() {
    if (sama) {
      sama = false;
      notifyListeners();
    } else {
      sama = true;
      notifyListeners();
    }
  }

  void swith() {
    if (isLogin) {
      isLogin = false;
      notifyListeners();
    } else {
      isLogin = true;
      notifyListeners();
    }
  }

  void swithVisibiliti() {
    if (visibiliti) {
      visibiliti = false;
      notifyListeners();
    } else {
      visibiliti = true;
      notifyListeners();
    }
  }

  void swithVisibilitiAturUlang() {
    if (visibilitiAturUlang) {
      visibilitiAturUlang = false;
      notifyListeners();
    } else {
      visibilitiAturUlang = true;
      notifyListeners();
    }
  }

  void login(BuildContext context) async {
    if (emailLogin.text.isEmpty || passwordLogin.text.isEmpty) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(SnackBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          content: AwesomeSnackbarContent(
            inMaterialBanner: true,
            title: 'Gagal!',
            message: 'Email dan password wajib di isi',
            contentType: ContentType.failure,
          ),
        ));
      return;
    }
    reqLogin = RequestState.loading;
    notifyListeners();
    final res = await authImpl.login(emailLogin.text, passwordLogin.text);
    res.fold((l) {
      reqLogin = RequestState.empty;
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
    }, (r) {
      reqLogin = RequestState.empty;
      LocalData().saveToken(r);

      notifyListeners();
      toRemovePage(context, const HomeView());
    });
  }

  void lupaPassword(BuildContext context) async {
    if (emailLupaPassword.text.isEmpty) {
      return;
    }
    reqLupaPassword = RequestState.loading;
    notifyListeners();
    final res = await authImpl.lupaPassword(emailLupaPassword.text);
    res.fold((l) {
      reqLupaPassword = RequestState.empty;
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
      notifyListeners();
    }, (r) {
      reqLupaPassword = RequestState.empty;
      emailLupaPassword.clear();
      final snackBar = SnackBar(
        /// need to set following properties for best effect of awesome_snackbar_content
        elevation: 0,
        // behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        content: AwesomeSnackbarContent(
          inMaterialBanner: true,
          title: 'Sukses', color: purple,
          message: 'Reset password berhasil, silahkan cek email yang terdaftar',

          /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
          contentType: ContentType.success,
        ),
      );

      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);

      notifyListeners();
      Navigator.pop(context);
    });
  }

  void updateSandi(BuildContext context) async {
    reqKirimUlang = RequestState.loading;
    notifyListeners();
    final res = await authImpl.updatePossword(
        emailLupaPassword.text, aturUlangSandi.text, '');
    res.fold((l) {
      reqKirimUlang = RequestState.empty;
      notifyListeners();
    }, (r) {
      reqKirimUlang = RequestState.empty;
      pesanView = "Berhasil Update password";

      notifyListeners();
    });
  }

  void masuk(BuildContext context) {
    isLogin = true;
    notifyListeners();
    toRemovePage(context, const LoginView());
  }

  void init() {
    isLogin = true;
    emailLogin = TextEditingController();
    passwordLogin = TextEditingController();
    emailLupaPassword = TextEditingController();
  }

  @override
  void dispose() {
    emailLogin.dispose();
    passwordLogin.dispose();
    emailLupaPassword.dispose();

    aturUlangSandi.dispose();
    aturUlangSandi2.dispose();
    super.dispose();
  }
}
