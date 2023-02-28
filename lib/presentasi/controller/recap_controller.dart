import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:penjual/const/request_datate.dart';
import 'package:penjual/data/impl/report_impl.dart';
import 'package:penjual/domian/model/recap_menu.dart';

class RecapController extends ChangeNotifier {
  ReportImpl reportImpl = ReportImpl();
  RequestState reqRecap = RequestState.empty;

  List<RecapMenu> listRecap = [];

  DateTime select = DateTime(2023, 1);
  List<DateTime> dateTime = [
    DateTime(2023, 1),
    DateTime(2023, 2),
    DateTime(2023, 3),
    DateTime(2023, 4),
    DateTime(2023, 5),
    DateTime(2023, 6),
    DateTime(2023, 7),
    DateTime(2023, 8),
    DateTime(2023, 9),
    DateTime(2023, 10),
    DateTime(2023, 11),
    DateTime(2023, 12),
  ];

  int total() => listRecap.isNotEmpty
      ? listRecap
          .map((e) => int.parse((e.total ?? '0')))
          .reduce((value, element) => value + element)
      : 0;

  void getRecap(BuildContext context) async {
    reqRecap = RequestState.loading;

    final respon = await reportImpl.getRecap(
        select.year.toString(), select.month.toString());

    respon.fold((l) {
      reqRecap = RequestState.error;
      notifyListeners();
      final snackBar = SnackBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        content: AwesomeSnackbarContent(
          inMaterialBanner: true,
          title: 'Gagal!',
          message: l,
          contentType: ContentType.failure,
        ),
      );

      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);
    }, (r) {
      listRecap = r;
      reqRecap = RequestState.loaded;
      notifyListeners();
    });
  }

  void setTanggal(DateTime value, BuildContext context) {
    reqRecap = RequestState.loading;
    select = value;
    notifyListeners();
    getRecap(context);
  }
}
